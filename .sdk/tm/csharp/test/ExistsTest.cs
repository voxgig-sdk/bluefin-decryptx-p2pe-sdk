// BluefinDecryptxP2pe SDK exists test.

using Xunit;

using BluefinDecryptxP2peSdk;

namespace BluefinDecryptxP2peSdk.Test;

public class ExistsTest
{
    [Fact]
    public void TestMode()
    {
        var testsdk = BluefinDecryptxP2peSDK.TestSDK(null, null);
        Assert.NotNull(testsdk);
    }
}
