import 'package:flutter/foundation.dart';

abstract class Presenter with ChangeNotifier {
  onInit();

  onDispose();
}
