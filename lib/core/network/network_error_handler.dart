import 'package:dio/dio.dart';
import 'package:bloomix/core/logging/logger.dart';
import 'package:bloomix/core/analytics/error_tracker.dart';

/// Network error handling utility following VGV best practices
class NetworkErrorHandler {
  /// Handle Dio exceptions and convert to user-friendly messages
  static String handleDioException(DioException exception) {
    ErrorTracker.trackError(
      'Network request failed',
      error: exception,
      stackTrace: exception.stackTrace,
      context: {
        'url': exception.requestOptions.uri.toString(),
        'method': exception.requestOptions.method,
        'statusCode': exception.response?.statusCode,
      },
    );

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        Logger.warning('Connection timeout');
        return 'Tempo limite de conexão excedido. Verifique sua internet.';

      case DioExceptionType.sendTimeout:
        Logger.warning('Send timeout');
        return 'Tempo limite para envio excedido. Tente novamente.';

      case DioExceptionType.receiveTimeout:
        Logger.warning('Receive timeout');
        return 'Tempo limite para recebimento excedido. Tente novamente.';

      case DioExceptionType.badResponse:
        return _handleBadResponse(exception);

      case DioExceptionType.cancel:
        Logger.info('Request cancelled');
        return 'Requisição cancelada.';

      case DioExceptionType.connectionError:
        Logger.error('Connection error');
        return 'Erro de conexão. Verifique sua internet.';

      case DioExceptionType.badCertificate:
        Logger.error('Bad certificate');
        return 'Erro de certificado SSL.';

      case DioExceptionType.unknown:
        Logger.error('Unknown network error');
        return 'Erro de rede desconhecido. Tente novamente.';
    }
  }

  /// Handle bad response errors
  static String _handleBadResponse(DioException exception) {
    final statusCode = exception.response?.statusCode;
    final statusMessage = exception.response?.statusMessage;

    Logger.error('Bad response: $statusCode - $statusMessage');

    switch (statusCode) {
      case 400:
        return 'Requisição inválida. Verifique os dados enviados.';
      case 401:
        return 'Não autorizado. Verifique suas credenciais.';
      case 403:
        return 'Acesso negado. Você não tem permissão para esta ação.';
      case 404:
        return 'Recurso não encontrado.';
      case 408:
        return 'Tempo limite da requisição excedido.';
      case 429:
        return 'Muitas requisições. Aguarde um momento antes de tentar novamente.';
      case 500:
        return 'Erro interno do servidor. Tente novamente mais tarde.';
      case 502:
        return 'Servidor temporariamente indisponível.';
      case 503:
        return 'Serviço temporariamente indisponível.';
      case 504:
        return 'Tempo limite do gateway excedido.';
      default:
        return 'Erro de servidor ($statusCode). Tente novamente.';
    }
  }

  /// Handle generic network errors
  static String handleGenericError(Object error) {
    ErrorTracker.trackError(
      'Generic network error',
      error: error,
    );

    if (error.toString().contains('SocketException')) {
      return 'Erro de conexão. Verifique sua internet.';
    } else if (error.toString().contains('HandshakeException')) {
      return 'Erro de certificado SSL.';
    } else if (error.toString().contains('TimeoutException')) {
      return 'Tempo limite excedido. Tente novamente.';
    } else {
      return 'Erro de rede. Tente novamente.';
    }
  }

  /// Check if error is retryable
  static bool isRetryableError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return true;

      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode;
        return statusCode != null && statusCode >= 500;

      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return false;
    }
  }

  /// Get retry delay based on attempt number
  static Duration getRetryDelay(int attempt) {
    // Exponential backoff: 1s, 2s, 4s, 8s, 16s
    final delayMs = 1000 * (1 << (attempt - 1));
    return Duration(milliseconds: delayMs.clamp(1000, 30000)); // Max 30s
  }
}
