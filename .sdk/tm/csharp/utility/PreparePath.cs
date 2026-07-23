// BluefinDecryptxP2pe SDK utility: preparePath.

using Voxgig.Struct;

namespace BluefinDecryptxP2peSdk.Util;

public static partial class SdkUtility
{
    internal static string PreparePathUtil(Context ctx)
    {
        var point = ctx.Point;

        var parts = StructUtils.GetProp(point, "parts") as List<object?>
            ?? new List<object?>();

        return StructUtils.Join(parts, "/", true);
    }
}
