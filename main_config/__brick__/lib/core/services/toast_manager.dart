import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastManager {
  static late GlobalKey<NavigatorState> navigatorKey;

  static void init(GlobalKey<NavigatorState> key) {
    navigatorKey = key;
  }

  static BuildContext? get _context => navigatorKey.currentContext;

  // نمایش نوتیف ساده
  static void show(String message, {ToastificationType type = ToastificationType.info}) {
    toastification.show(
      context: _context,
      title: Text(message),
      type: type,
      style: ToastificationStyle.minimal,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topCenter,
      animationDuration: const Duration(milliseconds: 300),
      showProgressBar: true,
    );
  }

  static void persistentInternetError(VoidCallback onRetry) {
    if (_context == null) return; // اگر context موجود نبود کاری نکن

    toastification.show(
      context: _context!,
      title: const Text('اتصال اینترنت برقرار نیست'),
      description: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () {
            print('Retry button pressed');
            onRetry();
          },
          child: const Text('بررسی مجدد'),
        ),
      ),
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
      alignment: Alignment.topCenter,
      animationDuration: const Duration(milliseconds: 300),
      showProgressBar: false,
      primaryColor: Colors.redAccent,
    );
  }

  static void success(String message) => show(message, type: ToastificationType.success);
  static void error(String message) => show(message, type: ToastificationType.error);
  static void warning(String message) => show(message, type: ToastificationType.warning);
  static void info(String message) => show(message);
}
