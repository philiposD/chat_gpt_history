import 'package:domain/repositories/repository.dart';

abstract class ExampleRepository extends Repository {
  Future<void> fetchExample({required String locale});
}
