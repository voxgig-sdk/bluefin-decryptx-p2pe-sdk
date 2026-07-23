// BluefinDecryptxP2peError - the SDK error type. Carries the pipeline error code,
// the originating context and cleaned result/spec snapshots.

namespace BluefinDecryptxP2peSdk;

public class BluefinDecryptxP2peError : Exception
{
    public bool IsBluefinDecryptxP2peError = true;
    public string Sdk = "BluefinDecryptxP2pe";
    public string Code;
    public Context? Ctx;
    public object? ResultVal;
    public object? SpecVal;

    public BluefinDecryptxP2peError(string code, string msg, Context? ctx)
        : base(msg)
    {
        Code = code;
        Ctx = ctx;
    }
}
