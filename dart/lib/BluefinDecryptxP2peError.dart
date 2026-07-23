class BluefinDecryptxP2peError extends Error {
  final bool isBluefinDecryptxP2peError = true;

  final String sdk = 'BluefinDecryptxP2pe';

  String code;
  String message;
  dynamic ctx;

  // Populated by makeError with the (cleaned) result and spec.
  dynamic result;
  dynamic spec;

  BluefinDecryptxP2peError(this.code, this.message, [this.ctx]);

  @override
  String toString() => 'BluefinDecryptxP2peError: ' + code + ': ' + message;
}
