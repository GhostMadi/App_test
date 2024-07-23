import 'package:dio/dio.dart';

class CatchException implements Exception {
  String message;
  CatchException({required this.message});

  @override
  String toString() {
    return 'error-$message';
  }

  factory CatchException.defineException(dynamic error) {
    if (error is DioException && error is CatchException) {
      return error.error as CatchException;
    }

    if (error is DioException) {
      if (error.type == DioExceptionType.connectionTimeout) {
        return CatchException(
            message: 'Превышено время обработки запроса. Повторите позднее');
      } else if (error.type == DioExceptionType.receiveTimeout) {
        return CatchException(
            message: 'Превышено время обработки запроса. Повторите позднее');
      } else if (error.response == null) {
        return CatchException(message: 'Нет интернет соединения');
      } else if (error.response!.statusCode == 401) {
        return CatchException(message: 'Ошибка авторизации');
      } else if (error.response!.statusCode == 405) {
        return CatchException(message: error.response!.data["message"]);
      } else if (error.response!.statusCode == 409) {
        return CatchException(message: error.response!.data["message"]);
      } else if (error.response!.statusCode == 500) {
        return CatchException(message: 'Ошибка сервера');
      } else {
        return CatchException(
          message: error.response.toString(),
        );
      }
    }
    if (error is CatchException) {
      return error;
    } else {
      return CatchException(message: error.toString());
    }
  }
}
