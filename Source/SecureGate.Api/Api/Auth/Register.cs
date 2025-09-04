using Microsoft.AspNetCore.Mvc;
using Microsoft.OpenApi.Models;
using SecureGate.Api.InternalDto.Auth;

namespace SecureGate.Api.Api.Auth;

public class Register
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
    
    private static async Task<IResult> Post(HttpContext context, [FromBody] RegisterRequestDto body)
    {
        return TypedResults.NotFound();
    }

}