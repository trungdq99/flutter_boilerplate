abstract class LocalServerException {
  factory LocalServerException([var message]) => _LocalServerException(message);
}

class _LocalServerException implements LocalServerException {
  final dynamic message;

  _LocalServerException([this.message]);

  @override
  String toString() {
    if (message == null) return 'LocalServerException';
    return message.toString();
  }
}
