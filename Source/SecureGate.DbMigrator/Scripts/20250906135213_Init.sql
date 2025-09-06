IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
CREATE TABLE [__EFMigrationsHistory] (
    [migration_id] nvarchar(150) NOT NULL,
    [product_version] nvarchar(32) NOT NULL,
    CONSTRAINT [pk___ef_migrations_history] PRIMARY KEY ([migration_id])
    );
END;
GO

CREATE TABLE [AspNetRoles] (
    [id] uniqueidentifier NOT NULL,
    [name] nvarchar(256) NULL,
    [normalized_name] nvarchar(256) NULL,
    [concurrency_stamp] nvarchar(max) NULL,
    CONSTRAINT [pk_asp_net_roles] PRIMARY KEY ([id])
    );
GO

CREATE TABLE [AspNetUsers] (
    [id] uniqueidentifier NOT NULL,
    [first_name] nvarchar(255) NOT NULL,
    [last_name] nvarchar(255) NOT NULL,
    [user_name] nvarchar(256) NULL,
    [normalized_user_name] nvarchar(256) NULL,
    [email] nvarchar(256) NULL,
    [normalized_email] nvarchar(256) NULL,
    [email_confirmed] bit NOT NULL,
    [password_hash] nvarchar(max) NULL,
    [security_stamp] nvarchar(max) NULL,
    [concurrency_stamp] nvarchar(max) NULL,
    [phone_number] nvarchar(max) NULL,
    [phone_number_confirmed] bit NOT NULL,
    [two_factor_enabled] bit NOT NULL,
    [lockout_end] datetimeoffset NULL,
    [lockout_enabled] bit NOT NULL,
    [access_failed_count] int NOT NULL,
    CONSTRAINT [pk_asp_net_users] PRIMARY KEY ([id])
    );
GO

CREATE TABLE [AspNetRoleClaims] (
    [id] int NOT NULL IDENTITY,
    [role_id] uniqueidentifier NOT NULL,
    [claim_type] nvarchar(max) NULL,
    [claim_value] nvarchar(max) NULL,
    CONSTRAINT [pk_asp_net_role_claims] PRIMARY KEY ([id]),
    CONSTRAINT [fk_asp_net_role_claims_asp_net_roles_role_id] FOREIGN KEY ([role_id]) REFERENCES [AspNetRoles] ([id]) ON DELETE CASCADE
    );
GO

CREATE TABLE [AspNetUserClaims] (
    [id] int NOT NULL IDENTITY,
    [user_id] uniqueidentifier NOT NULL,
    [claim_type] nvarchar(max) NULL,
    [claim_value] nvarchar(max) NULL,
    CONSTRAINT [pk_asp_net_user_claims] PRIMARY KEY ([id]),
    CONSTRAINT [fk_asp_net_user_claims_asp_net_users_user_id] FOREIGN KEY ([user_id]) REFERENCES [AspNetUsers] ([id]) ON DELETE CASCADE
    );
GO

CREATE TABLE [AspNetUserLogins] (
    [login_provider] nvarchar(450) NOT NULL,
    [provider_key] nvarchar(450) NOT NULL,
    [provider_display_name] nvarchar(max) NULL,
    [user_id] uniqueidentifier NOT NULL,
    CONSTRAINT [pk_asp_net_user_logins] PRIMARY KEY ([login_provider], [provider_key]),
    CONSTRAINT [fk_asp_net_user_logins_asp_net_users_user_id] FOREIGN KEY ([user_id]) REFERENCES [AspNetUsers] ([id]) ON DELETE CASCADE
    );
GO

CREATE TABLE [AspNetUserRoles] (
    [user_id] uniqueidentifier NOT NULL,
    [role_id] uniqueidentifier NOT NULL,
     CONSTRAINT [pk_asp_net_user_roles] PRIMARY KEY ([user_id], [role_id]),
    CONSTRAINT [fk_asp_net_user_roles_asp_net_roles_role_id] FOREIGN KEY ([role_id]) REFERENCES [AspNetRoles] ([id]) ON DELETE CASCADE,
    CONSTRAINT [fk_asp_net_user_roles_asp_net_users_user_id] FOREIGN KEY ([user_id]) REFERENCES [AspNetUsers] ([id]) ON DELETE CASCADE
    );
GO

CREATE TABLE [AspNetUserTokens] (
    [user_id] uniqueidentifier NOT NULL,
    [login_provider] nvarchar(450) NOT NULL,
    [name] nvarchar(450) NOT NULL,
    [value] nvarchar(max) NULL,
    CONSTRAINT [pk_asp_net_user_tokens] PRIMARY KEY ([user_id], [login_provider], [name]),
    CONSTRAINT [fk_asp_net_user_tokens_asp_net_users_user_id] FOREIGN KEY ([user_id]) REFERENCES [AspNetUsers] ([id]) ON DELETE CASCADE
    );
GO

CREATE INDEX [ix_asp_net_role_claims_role_id] ON [AspNetRoleClaims] ([role_id]);
GO

CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([normalized_name]) WHERE [normalized_name] IS NOT NULL;
GO

CREATE INDEX [ix_asp_net_user_claims_user_id] ON [AspNetUserClaims] ([user_id]);
GO

CREATE INDEX [ix_asp_net_user_logins_user_id] ON [AspNetUserLogins] ([user_id]);
GO

CREATE INDEX [ix_asp_net_user_roles_role_id] ON [AspNetUserRoles] ([role_id]);
GO

CREATE INDEX [EmailIndex] ON [AspNetUsers] ([normalized_email]);
GO

CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([normalized_user_name]) WHERE [normalized_user_name] IS NOT NULL;
GO