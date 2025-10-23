import 'package:bloomix/core/analytics/error_tracker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ErrorTracker', () {
    setUp(ErrorTracker.clearErrors);

    test('should track error with default severity', () {
      const message = 'Test error message';
      const error = 'Test error';

      ErrorTracker.trackError(message, error: error);

      final summary = ErrorTracker.getErrorSummary();
      expect(summary['total_errors'], equals(1));
      expect(summary['error_counts']['error'], equals(1));
    });

    test('should track error with custom severity', () {
      const message = 'Test warning message';

      ErrorTracker.trackError(
        message,
        severity: ErrorSeverity.warning,
      );

      final summary = ErrorTracker.getErrorSummary();
      expect(summary['total_errors'], equals(1));
      expect(summary['error_counts']['warning'], equals(1));
    });

    test('should track error with context', () {
      const message = 'Test error with context';
      final context = {'key1': 'value1', 'key2': 'value2'};

      ErrorTracker.trackError(message, context: context);

      final summary = ErrorTracker.getErrorSummary();
      expect(summary['total_errors'], equals(1));

      final recentErrors = summary['recent_errors'] as List;
      expect(recentErrors.length, equals(1));

      final errorData = recentErrors.first as Map<String, dynamic>;
      expect(errorData['context'], equals(context));
    });

    test('should track user action', () {
      const action = 'button_clicked';
      final properties = {'button_name': 'identify_plant'};

      ErrorTracker.trackUserAction(action, properties: properties);

      // User actions are logged but not stored in error summary
      final summary = ErrorTracker.getErrorSummary();
      expect(summary['total_errors'], equals(0));
    });

    test('should track performance metrics', () {
      const metric = 'api_response_time';
      const value = 150.5;
      const unit = 'ms';
      final properties = {'endpoint': '/identify'};

      ErrorTracker.trackPerformance(
        metric,
        value: value,
        unit: unit,
        properties: properties,
      );

      // Performance metrics are logged but not stored in error summary
      final summary = ErrorTracker.getErrorSummary();
      expect(summary['total_errors'], equals(0));
    });

    test('should provide error summary', () {
      // Track multiple errors with different severities
      ErrorTracker.trackError('Error 1');
      ErrorTracker.trackError('Error 2', severity: ErrorSeverity.warning);
      ErrorTracker.trackError('Error 3');

      final summary = ErrorTracker.getErrorSummary();

      expect(summary['total_errors'], equals(3));
      expect(summary['error_counts']['error'], equals(2));
      expect(summary['error_counts']['warning'], equals(1));
      expect(summary['recent_errors'], isA<List>());
    });

    test('should export errors as JSON', () {
      const message = 'Test error for export';
      const error = 'Export test error';

      ErrorTracker.trackError(message, error: error);

      final exportedJson = ErrorTracker.exportErrors();
      expect(exportedJson, isA<String>());
      expect(exportedJson.contains(message), isTrue);
      expect(exportedJson.contains(error), isTrue);
    });

    test('should clear all errors', () {
      ErrorTracker.trackError('Error 1');
      ErrorTracker.trackError('Error 2');

      expect(ErrorTracker.getErrorSummary()['total_errors'], equals(2));

      ErrorTracker.clearErrors();

      expect(ErrorTracker.getErrorSummary()['total_errors'], equals(0));
    });

    test('should handle multiple errors correctly', () {
      // Track 10 errors
      for (var i = 0; i < 10; i++) {
        ErrorTracker.trackError('Error $i');
      }

      final summary = ErrorTracker.getErrorSummary();
      expect(summary['total_errors'], equals(10));
      expect(summary['error_counts']['error'], equals(10));
    });
  });
}
