abstract class Factory {
  String get asd;
}

class AppFactory implements Factory {
  init() {
    print('-->Factory init');
  }

  @override
  String get asd => throw UnimplementedError();

  static final AppFactory _singleton = AppFactory._internal();

  factory AppFactory() {
    return _singleton;
  }

  AppFactory._internal();
}
