using BenchmarkDotNet.Attributes;
using SecureGate.Api.Services;

namespace Benchmark.Services;

public class SimpleServiceBenchmark
{
    private readonly SimpleService _service = new();
    
    [Benchmark]
    public void SimpleService()
    {
        _service.Plus(1, 3);
    }
}