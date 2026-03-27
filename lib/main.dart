import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

final logger = Logger();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      logWriterCallback: (value, {isError = false}) {
        if (isError) {
          logger.e(value);
        } else if (Get.isLogEnable) {
          logger.d(value);
        }
      },
      // theme: AppTheme.light,
    ),
  );
}
