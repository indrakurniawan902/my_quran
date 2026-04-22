import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class QuraanDioErrHandler {
  String handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Network error occurred. Please check your internet connection.';

      case DioExceptionType.receiveTimeout:
        return 'Request timeout occurred';

      case DioExceptionType.connectionError:
        // SSL pinning failure lands here
        if (_isSslPinningError(error)) {
          return 'Secure connection failed. Please update your app.';
        }
        return 'Network error occurred. Please check your internet connection.';

      case DioExceptionType.badResponse:
        if (error.response != null) {
          if (error.response!.statusCode == 401) {
            return 'Authentication failed. Please login again.';
          } else if (error.response!.statusCode == 404) {
            return 'Requested resource not found.';
          } else if (error.response!.statusCode == 500) {
            return 'Server error occurred. Please try again later.';
          } else {
            return 'An unexpected error occurred. Please try again later.';
          }
        }

      default:
        return 'An unexpected error occurred. Please try again later 1.';
    }
    return 'An unexpected error occurred. Please try again later 2.';
  }

  bool _isSslPinningError(DioException error) {
    final message = error.message?.toLowerCase() ?? '';
    final innerMessage = error.error?.toString().toLowerCase() ?? '';

    return message.contains('handshake') ||
        message.contains('certificate') ||
        innerMessage.contains('handshake') ||
        innerMessage.contains('certificate') ||
        innerMessage.contains('bad_pkcs12') ||
        innerMessage.contains('tlsexception');
  }
}
