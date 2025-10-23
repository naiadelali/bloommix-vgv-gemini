import 'dart:convert';

import 'package:bloomix/core/logging/logger.dart';
import 'package:flutter/foundation.dart';

/// Error tracking and analytics utility following VGV best practices
class ErrorTracker {
  static final List<ErrorEvent> _errors = [];
  static const int _maxErrors = 100; // Keep only last 100 errors

  /// Track an error with context
  static void trackError(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, dynamic>? context,
    ErrorSeverity severity = ErrorSeverity.error,
  }) {
    final errorEvent = ErrorEvent(
      message: message,
      error: error,
      stackTrace: stackTrace,
      context: context ?? {},
      severity: severity,
      timestamp: DateTime.now(),
    );

    _errors.add(errorEvent);

    // Keep only the most recent errors
    if (_errors.length > _maxErrors) {
      _errors.removeAt(0);
    }

    // Log based on severity
    switch (severity) {
      case ErrorSeverity.debug:
        Logger.debug(message, error: error, stackTrace: stackTrace);
      case ErrorSeverity.info:
        Logger.info(message, error: error, stackTrace: stackTrace);
      case ErrorSeverity.warning:
        Logger.warning(message, error: error, stackTrace: stackTrace);
      case ErrorSeverity.error:
        Logger.error(message, error: error, stackTrace: stackTrace);
      case ErrorSeverity.fatal:
        Logger.fatal(message, error: error, stackTrace: stackTrace);
    }

    // In production, you might want to send to external service
    if (kReleaseMode) {
      _sendToExternalService(errorEvent);
    }
  }

  /// Track user interactions for analytics
  static void trackUserAction(
    String action, {
    Map<String, dynamic>? properties,
  }) {
    Logger.info('User action: $action', error: properties);

    // In production, send to analytics service
    if (kReleaseMode) {
      _sendToAnalyticsService(action, properties);
    }
  }

  /// Track app performance metrics
  static void trackPerformance(
    String metric, {
    required double value,
    String? unit,
    Map<String, dynamic>? properties,
  }) {
    Logger.info(
      'Performance metric: $metric = $value${unit ?? ''}',
      error: properties,
    );

    // In production, send to performance monitoring service
    if (kReleaseMode) {
      _sendToPerformanceService(metric, value, unit, properties);
    }
  }

  /// Get error summary for debugging
  static Map<String, dynamic> getErrorSummary() {
    final errorCounts = <ErrorSeverity, int>{};
    for (final error in _errors) {
      errorCounts[error.severity] = (errorCounts[error.severity] ?? 0) + 1;
    }

    // Get recent errors (last 5, or all if less than 5)
    final recentErrors = _errors.length <= 5
        ? _errors.map((e) => e.toJson()).toList()
        : _errors.skip(_errors.length - 5).map((e) => e.toJson()).toList();

    return {
      'total_errors': _errors.length,
      'error_counts': errorCounts.map((k, v) => MapEntry(k.name, v)),
      'recent_errors': recentErrors,
    };
  }

  /// Clear all tracked errors
  static void clearErrors() {
    _errors.clear();
    Logger.info('Error tracking cleared');
  }

  /// Export errors for debugging
  static String exportErrors() {
    return jsonEncode(_errors.map((e) => e.toJson()).toList());
  }

  // Private methods for external service integration
  static void _sendToExternalService(ErrorEvent errorEvent) {
    // TODO: Implement integration with services like:
    // - Sentry
    // - Crashlytics
    // - Bugsnag
    // - Custom error reporting service
  }

  static void _sendToAnalyticsService(
    String action,
    Map<String, dynamic>? properties,
  ) {
    // TODO: Implement integration with analytics services like:
    // - Firebase Analytics
    // - Mixpanel
    // - Amplitude
    // - Custom analytics service
  }

  static void _sendToPerformanceService(
    String metric,
    double value,
    String? unit,
    Map<String, dynamic>? properties,
  ) {
    // TODO: Implement integration with performance monitoring services like:
    // - Firebase Performance
    // - New Relic
    // - Custom performance service
  }
}

/// Error severity levels
enum ErrorSeverity {
  debug,
  info,
  warning,
  error,
  fatal,
}

/// Error event model
class ErrorEvent {
  const ErrorEvent({
    required this.message,
    required this.context,
    required this.severity,
    required this.timestamp,
    this.error,
    this.stackTrace,
  });

  final String message;
  final Object? error;
  final StackTrace? stackTrace;
  final Map<String, dynamic> context;
  final ErrorSeverity severity;
  final DateTime timestamp;

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'error': error?.toString(),
      'stackTrace': stackTrace?.toString(),
      'context': context,
      'severity': severity.name,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
