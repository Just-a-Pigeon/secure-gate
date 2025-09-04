using SecureGate.Api.Api.Auth;

namespace SecureGate.Api.Api;

public static class Api
{
    public static void AddApiEndpoints(this WebApplication app)
    {
        var api = app.MapGroup("/api");
        var v1 = api.MapGroup("/v1");
        
        var auth =  v1.MapGroup("/auth");

        Register.Map(auth);
    }
}