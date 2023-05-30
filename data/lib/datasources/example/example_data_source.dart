import 'dart:async';
import 'dart:convert' show json;
import 'dart:io';

import 'package:data/datasources/example/example_exception.dart';
import 'package:path_provider/path_provider.dart';

abstract class StoredExamplesDataSource {
  Future<Map<String, dynamic>> fetchStoredExamples(
      {required String localeCode});
}

class LocalExamplesDataSource implements StoredExamplesDataSource {
  LocalExamplesDataSource();

  @override
  Future<Map<String, String>> fetchStoredExamples(
      {required String localeCode}) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String path = dir.path;
    final File file = File('$path/examples/${localeCode}.json');

    try {
      String contents = await file.readAsString();
      Map<String, dynamic> decoded = json.decode(contents);

      return decoded.map((key, value) => MapEntry(key, value.toString()));
    } on Exception catch (e) {
      throw ExampleException(reason: ExampleExceptions.fileNotFound);
    }
  }
}
