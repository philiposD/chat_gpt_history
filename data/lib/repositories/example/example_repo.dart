import 'dart:html';
import 'package:data/datasources/example/example_data_source.dart';
import 'package:data/datasources/example/example_exception.dart';
import 'package:domain/repositories/example/example_repo.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  ExampleRepositoryImpl(this.localExamplesDataSource);

  final LocalExamplesDataSource localExamplesDataSource;

  @override
  Future<void> fetchExample({required String locale}) async {
    try {
      await localExamplesDataSource.fetchStoredExamples(localeCode: locale);
    } on ExampleException catch (e) {
      // TODO
      if (e.reason == ExampleExceptions.fileNotFound) {
        print('-->File not found');
      }
    }
  }
}
