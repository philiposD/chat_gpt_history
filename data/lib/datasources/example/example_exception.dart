class ExampleException implements Exception {
  final ExampleExceptions reason;

  ExampleException({required this.reason});
}

enum ExampleExceptions {
  fileNotFound,
}

extension ExampleExt on ExampleExceptions {
  Exception get error => ExampleException(reason: this);
}
