import 'dart:async';
import 'package:bloomix/core/logging/logger.dart';

/// Performance monitoring utility following VGV best practices
class PerformanceMonitor {
  static final Map<String, Stopwatch> _timers = {};
  static final Map<String, List<Duration>> _metrics = {};

  /// Start timing an operation
  static void startTimer(String operation) {
    _timers[operation] = Stopwatch()..start();
    Logger.debug('Started timing: $operation');
  }

  /// Stop timing an operation and record the duration
  static Duration stopTimer(String operation) {
    final stopwatch = _timers.remove(operation);
    if (stopwatch == null) {
      Logger.warning('Timer not found for operation: $operation');
      return Duration.zero;
    }

    stopwatch.stop();
    final duration = stopwatch.elapsed;

    _metrics.putIfAbsent(operation, () => []).add(duration);

    Logger.info(
        'Operation "$operation" completed in ${duration.inMilliseconds}ms');

    // Log slow operations
    if (duration.inMilliseconds > 1000) {
      Logger.warning(
          'Slow operation detected: $operation took ${duration.inMilliseconds}ms');
    }

    return duration;
  }

  /// Get average duration for an operation
  static Duration getAverageDuration(String operation) {
    final durations = _metrics[operation];
    if (durations == null || durations.isEmpty) {
      return Duration.zero;
    }

    final totalMs = durations.fold<int>(
        0, (sum, duration) => sum + duration.inMilliseconds);
    return Duration(milliseconds: totalMs ~/ durations.length);
  }

  /// Get all performance metrics
  static Map<String, Duration> getAllMetrics() {
    final result = <String, Duration>{};
    for (final operation in _metrics.keys) {
      result[operation] = getAverageDuration(operation);
    }
    return result;
  }

  /// Clear all metrics
  static void clearMetrics() {
    _timers.clear();
    _metrics.clear();
    Logger.debug('Performance metrics cleared');
  }

  /// Log all metrics summary
  static void logMetricsSummary() {
    final metrics = getAllMetrics();
    if (metrics.isEmpty) {
      Logger.info('No performance metrics available');
      return;
    }

    Logger.info('Performance Metrics Summary:');
    for (final entry in metrics.entries) {
      Logger.info('${entry.key}: ${entry.value.inMilliseconds}ms average');
    }
  }
}

/// Extension to easily measure function execution time
extension PerformanceExtension<T> on Future<T> {
  /// Measure the execution time of a Future
  Future<T> measureTime(String operation) async {
    PerformanceMonitor.startTimer(operation);
    try {
      final result = await this;
      PerformanceMonitor.stopTimer(operation);
      return result;
    } catch (e) {
      PerformanceMonitor.stopTimer(operation);
      rethrow;
    }
  }
}
