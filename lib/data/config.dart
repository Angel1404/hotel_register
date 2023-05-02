import 'package:flutter/foundation.dart';

class Config {
  // static const login = !kDebugMode;
  static final data = {
    'title': 'Hotel Stil Cartagena',
    'version': 'Alpha', // Versión, se actualiza dinamicamente de pubspec
    'testOn': kDebugMode,
    'serverURL': 'https://',
  };
}
