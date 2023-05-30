import 'package:domain/repositories/shared_prefs_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsRepo implements SharedPreferencesRepository {
  String fieldJsonFile = 'jsonFile';

  @override
  Future<String?> getStoredJsonFile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedJson = prefs.getString(fieldJsonFile);

    return storedJson;
  }

  @override
  Future<void> setJsonFile({required String jsonFile}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(fieldJsonFile, jsonFile);
  }
}
