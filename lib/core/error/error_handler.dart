import 'package:dio/dio.dart';
import 'package:stylehub/core/error/error_model.dart';
import 'package:stylehub/core/error/errors.dart';

enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError
}

class ResponseCode {
  static const int success = 200; 
  static const int noContent = 201; 
  static const int badRequest = 400; 
  static const int unauthorized = 401; 
  static const int forbidden = 403; 
  static const int internalServerError = 500; 
  static const int notFound = 404; 
  static const int apiLogicError = 422; 

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

class ResponseMessage {
  static const String noContent =
      ApiErrors.noContent; // success with no data (no content)
  static const String badRequest =
      ApiErrors.badRequestError; // failure, API rejected request
  static const String unauthorized =
      ApiErrors.unauthorizedError; // failure, user is not authorised
  static const String forbidden =
      ApiErrors.forbiddenError; // failure, API rejected request
  static const String internalServerError =
      ApiErrors.internalServerError; // failure, crash in server side
  static const String notFound =
      ApiErrors.notFoundError; // failure, crash in server side

  // local status code
  static const String connectTimeout = ApiErrors.timeoutError;
  static const String cancel = ApiErrors.defaultError;
  static const String receiveTimeout = ApiErrors.timeoutError;
  static const String sendTimeout = ApiErrors.timeoutError;
  static const String cacheError = ApiErrors.cacheError;
  static const String noInternetConnection = ApiErrors.noInternetError;
  static const String defaultError = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.noContent:
        return const ApiErrorModel(message: ResponseMessage.noContent ,errors: Errors(msg: ApiErrors.noContent) );
      case DataSource.badRequest:
        return const ApiErrorModel(message: ResponseMessage.badRequest, errors: Errors(msg: ApiErrors.noContent));
      case DataSource.forbidden:
        return const ApiErrorModel(message: ResponseMessage.forbidden, errors: Errors(msg: ApiErrors.noContent));
      case DataSource.unauthorized:
        return const ApiErrorModel(message: ResponseMessage.unauthorized, errors: Errors(msg: ApiErrors.noContent));
      case DataSource.notFound:
        return const ApiErrorModel(message: ResponseMessage.notFound, errors: Errors(msg: ApiErrors.noContent));
      case DataSource.internalServerError:
        return const ApiErrorModel(
            message: ResponseMessage.internalServerError, errors: Errors(msg: ApiErrors.noContent));
      case DataSource.connectTimeout:
        return const ApiErrorModel(message: ResponseMessage.connectTimeout,);
      case DataSource.cancel:
        return const ApiErrorModel(message: ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return const ApiErrorModel(message: ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return const ApiErrorModel(message: ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return const ApiErrorModel(message: ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return const ApiErrorModel(
            message: ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return const ApiErrorModel(message: ResponseMessage.defaultError);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.defaultError.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.defaultError.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();
  }
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}