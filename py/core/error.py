# BluefinDecryptxP2pe SDK error

from __future__ import annotations


class BluefinDecryptxP2peError(Exception):
    def __init__(self, code="", msg="", ctx=None):
        super().__init__(msg)
        self.is_sdk_error = True
        self.sdk = "BluefinDecryptxP2pe"
        self.code = code
        self.msg = msg
        self.ctx = ctx
        self.result = None
        self.spec = None

    def __str__(self):
        return self.msg
