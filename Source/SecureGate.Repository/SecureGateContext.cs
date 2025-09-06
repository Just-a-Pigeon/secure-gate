using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using SecureGate.Domain.Entities;

namespace SecureGate.Repository;

public class SecureGateContext(DbContextOptions<SecureGateContext> options) : IdentityDbContext<ApplicationUser, IdentityRole<Guid>, Guid>(options)
{

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(SecureGateContext).Assembly);
        base.OnModelCreating(modelBuilder);
    }
    
    internal class Factory : IDesignTimeDbContextFactory<SecureGateContext>
    {
        public SecureGateContext CreateDbContext(string[] args)
        {
            var optionsBuilder = new DbContextOptionsBuilder<SecureGateContext>();
            optionsBuilder
                .UseSqlServer()
                .UseSnakeCaseNamingConvention();
            return new SecureGateContext(optionsBuilder.Options);
        }
    }
}