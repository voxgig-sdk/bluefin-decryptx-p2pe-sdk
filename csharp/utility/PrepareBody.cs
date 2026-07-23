// BluefinDecryptxP2pe SDK utility: prepareBody.

namespace BluefinDecryptxP2peSdk.Util;

public static partial class SdkUtility
{
    internal static object? PrepareBodyUtil(Context ctx)
    {
        var op = ctx.Op!;

        if (op.Input == "data")
        {
            var body = ctx.Utility!.TransformRequest(ctx);
            return body;
        }

        return null;
    }
}
