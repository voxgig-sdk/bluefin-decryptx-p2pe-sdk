# BluefinDecryptxP2pe SDK utility: make_context

from core.context import BluefinDecryptxP2peContext


def make_context_util(ctxmap, basectx):
    return BluefinDecryptxP2peContext(ctxmap, basectx)
