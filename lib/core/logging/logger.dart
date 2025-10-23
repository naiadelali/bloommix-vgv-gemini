import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// Centralized logging utility following VGV best practices
class Logger {
  static const String _name = 'Bloomix';

  /// Log debug information
  static void debug(String message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      developer.log(
        message,
        name: _name,
        level: 500, // Debug level
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Log info information
  static void info(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(
      message,
      name: _name,
      level: 800, // Info level
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log warning information
  static void warning(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(
      message,
      name: _name,
      level: 900, // Warning level
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log error information
  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(
      message,
      name: _name,
      level: 1000, // Error level
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log fatal/critical information
  static void fatal(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(
      message,
      name: _name,
      level: 1200, // Fatal level
      error: error,
      stackTrace: stackTrace,
    );
  }
}
