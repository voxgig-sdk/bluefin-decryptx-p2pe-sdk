// Kif entity client for the BluefinDecryptxP2pe SDK.

using Voxgig.Struct;

namespace BluefinDecryptxP2peSdk.Entity;

public class KifEntity : BluefinDecryptxP2peEntityBase
{
    public KifEntity(BluefinDecryptxP2peSDK client, Dictionary<string, object?>? entopts = null)
        : base(client, entopts, "kif")
    {
    }

    public override IEntity Make()
    {
        return new KifEntity(client, CloneOpts());
    }

    // (load not defined by this API - base class throws UnsupportedOp)

    public override object? List(Dictionary<string, object?>? reqmatch,
        Dictionary<string, object?>? ctrl = null)
    {
        var ctx = utility.MakeContext(new Dictionary<string, object?>
        {
            ["opname"] = "list",
            ["ctrl"] = ctrl,
            ["match"] = match,
            ["data"] = data,
            ["reqmatch"] = reqmatch,
        }, entctx);
    
        return RunOp(ctx, () =>
        {
            if (ctx.Result != null)
            {
                if (ctx.Result.Resmatch != null)
                {
                    match = ctx.Result.Resmatch;
                }
            }
        });
    }

    // (create not defined by this API - base class throws UnsupportedOp)

    // (update not defined by this API - base class throws UnsupportedOp)

    // (remove not defined by this API - base class throws UnsupportedOp)
}
