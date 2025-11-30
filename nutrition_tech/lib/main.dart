import 'package:flutter/material.dart';

import 'core/app/app.dart';
import 'core/di/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerDi();
  runApp(const App());
}
