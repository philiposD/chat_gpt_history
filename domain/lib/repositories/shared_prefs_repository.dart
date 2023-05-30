import 'package:domain/repositories/repository.dart';

abstract class SharedPreferencesRepository extends Repository {
  Future<void> setJsonFile({required String jsonFile});
  Future<String?> getStoredJsonFile();
}
