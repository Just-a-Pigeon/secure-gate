namespace SecureGate.Api.InternalDto.Auth;

public class RegisterRequestDto
{
    public string Username { get; set; } = null!;
    public string Password { get; set; } = null!;
    public string CheckPassword { get; set; } = null!;
}