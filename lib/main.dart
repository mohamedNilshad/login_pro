import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_pro/src/app/app.dart';
import 'package:login_pro/src/core/views/system_error_screen.dart';
void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    ErrorWidget.builder = (errorDetails) => const CustomSystemErrorScreen();
    runApp(const App());
  }, (error, stack) =>
      print(error));
}

