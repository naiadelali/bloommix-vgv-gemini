import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Simple caching utility
class CacheManager {
  static const String _keyPrefix = 'bloomix_cache_';
  static const Duration _defaultTtl = Duration(hours: 24);

  /// Cache data with TTL
  static Future<void> cacheData<T>(
    String key,
    T data, {
    Duration? ttl,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cacheKey = '$_keyPrefix$key';
      final ttlDuration = ttl ?? _defaultTtl;
      final expiryTime = DateTime.now().add(ttlDuration);

      // Serialize data
      String serializedData;
      if (data is String) {
        serializedData = data;
      } else {
        serializedData = jsonEncode(data);
      }

      // Create simple cache entry
      final cacheEntry = {
        'data': serializedData,
        'expiryTime': expiryTime.toIso8601String(),
      };

      await prefs.setString(cacheKey, jsonEncode(cacheEntry));
    } catch (e) {
      // Silent fail in cache operations
    }
  }

  /// Retrieve cached data
  static Future<T?> getCachedData<T>(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cacheKey = '$_keyPrefix$key';
      final cacheString = prefs.getString(cacheKey);

      if (cacheString == null) return null;

      final cacheJson = jsonDecode(cacheString) as Map<String, dynamic>;

      // Check if cache is expired
      final expiryTime = DateTime.parse(cacheJson['expiryTime'] as String);
      if (DateTime.now().isAfter(expiryTime)) {
        await prefs.remove(cacheKey);
        return null;
      }

      // Deserialize data
      final serializedData = cacheJson['data'] as String;
      if (T == String) {
        return serializedData as T;
      } else {
        return jsonDecode(serializedData) as T;
      }
    } catch (e) {
      return null;
    }
  }

  /// Check if data is cached and not expired
  static Future<bool> isCached(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cacheKey = '$_keyPrefix$key';
      final cacheString = prefs.getString(cacheKey);

      if (cacheString == null) return false;

      final cacheJson = jsonDecode(cacheString) as Map<String, dynamic>;
      final expiryTime = DateTime.parse(cacheJson['expiryTime'] as String);

      return DateTime.now().isBefore(expiryTime);
    } catch (e) {
      return false;
    }
  }

  /// Remove cached data
  static Future<void> removeCachedData(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cacheKey = '$_keyPrefix$key';
      await prefs.remove(cacheKey);
    } catch (e) {
      // Silent fail
    }
  }

  /// Clear all cached data
  static Future<void> clearAllCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final keys = prefs.getKeys().where((key) => key.startsWith(_keyPrefix));

      for (final key in keys) {
        await prefs.remove(key);
      }
    } catch (e) {
      // Silent fail
    }
  }
}
