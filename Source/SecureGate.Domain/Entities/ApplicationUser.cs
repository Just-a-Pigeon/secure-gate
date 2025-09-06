using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

namespace SecureGate.Domain.Entities;

public class ApplicationUser : IdentityUser<Guid>
{
    [MaxLength(255)]
    public string FirstName { get; set; } = null!;
    
    [MaxLength(255)]
    public string LastName { get; set; } = null!;
}