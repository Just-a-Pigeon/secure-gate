// See https://aka.ms/new-console-template for more information

using SecureGate.Benchmark.Services;
using BenchmarkDotNet.Running;

Console.WriteLine("Hello, World!");

var summary = BenchmarkRunner.Run<SimpleServiceBenchmark>();