# BluefinDecryptxP2pe SDK feature factory

from bluefindecryptxp2pe_sdk.feature.base_feature import BluefinDecryptxP2peBaseFeature
from bluefindecryptxp2pe_sdk.feature.test_feature import BluefinDecryptxP2peTestFeature


def _make_feature(name):
    features = {
        "base": lambda: BluefinDecryptxP2peBaseFeature(),
        "test": lambda: BluefinDecryptxP2peTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
