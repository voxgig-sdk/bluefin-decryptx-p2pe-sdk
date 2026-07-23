// Success entity client for the BluefinDecryptxP2pe SDK.

using Voxgig.Struct;

namespace BluefinDecryptxP2peSdk.Entity;

public class SuccessEntity : BluefinDecryptxP2peEntityBase
{
    public SuccessEntity(BluefinDecryptxP2peSDK client, Dictionary<string, object?>? entopts = null)
        : base(client, entopts, "success")
    {
    }

    public override IEntity Make()
    {
        return new SuccessEntity(client, CloneOpts());
    }

    // (load not defined by this API - base class throws UnsupportedOp)

    // (list not defined by this API - base class throws UnsupportedOp)

    public override object? Create(Dictionary<string, object?>? reqdata,
        Dictionary<string, object?>? ctrl = null)
    {
        var ctx = utility.MakeContext(new Dictionary<string, object?>
        {
            ["opname"] = "create",
            ["ctrl"] = ctrl,
            ["match"] = match,
            ["data"] = data,
            ["reqdata"] = reqdata,
        }, entctx);
    
        return RunOp(ctx, () =>
        {
            if (ctx.Result != null)
            {
                if (ctx.Result.Resdata != null)
                {
                    data = Helpers.ToMapAny(
                        Voxgig.Struct.StructUtils.Clone(ctx.Result.Resdata))
                        ?? new Dictionary<string, object?>();
                }
            }
        });
    }

    // (update not defined by this API - base class throws UnsupportedOp)

    public override object? Remove(Dictionary<string, object?>? reqmatch,
        Dictionary<string, object?>? ctrl = null)
    {
        var ctx = utility.MakeContext(new Dictionary<string, object?>
        {
            ["opname"] = "remove",
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
                if (ctx.Result.Resdata != null)
                {
                    data = Helpers.ToMapAny(
                        Voxgig.Struct.StructUtils.Clone(ctx.Result.Resdata))
                        ?? new Dictionary<string, object?>();
                }
            }
        });
    }
}
