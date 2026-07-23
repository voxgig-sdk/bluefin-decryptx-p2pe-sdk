// User entity client for the BluefinDecryptxP2pe SDK.

using Voxgig.Struct;

namespace BluefinDecryptxP2peSdk.Entity;

public class UserEntity : BluefinDecryptxP2peEntityBase
{
    public UserEntity(BluefinDecryptxP2peSDK client, Dictionary<string, object?>? entopts = null)
        : base(client, entopts, "user")
    {
    }

    public override IEntity Make()
    {
        return new UserEntity(client, CloneOpts());
    }

    public override object? Load(Dictionary<string, object?>? reqmatch,
        Dictionary<string, object?>? ctrl = null)
    {
        var ctx = utility.MakeContext(new Dictionary<string, object?>
        {
            ["opname"] = "load",
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

    // (list not defined by this API - base class throws UnsupportedOp)

    // (create not defined by this API - base class throws UnsupportedOp)

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
