using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.OpenApi.Models;
using SecureGate.Api.InternalDto.Auth;
using SecureGate.Domain.Entities;

namespace SecureGate.Api.Api.Auth;

public static class Register
{
    public static void Map(RouteGroupBuilder routeGroupBuilder)
    {
        routeGroupBuilder.MapPost("/register", Post)
            .WithName("Register")
            .WithDescription("Register new user")
            .WithOpenApi(operation => new OpenApiOperation(operation)
            {
                Summary = "This endpoint registers a new user."
            })
            .Produces<Guid>();
    }

    private static async Task<IResult> Post([FromServices] UserManager<ApplicationUser> userManager,
        HttpContext context, [FromBody] RegisterRequestDto body)
    {
        var user = new ApplicationUser { FirstName = body.FirstName, LastName = body.LastName, Email = body.Email, UserName = body.UserName};
        var result = await userManager.CreateAsync(user, body.Password);
        if (!result.Succeeded) return TypedResults.BadRequest(result.Errors);
        return TypedResults.Ok();
    }
}