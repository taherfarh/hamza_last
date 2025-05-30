import 'package:dio/dio.dart';
import '../constant/strings.dart';
import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return getKnownErrors(
          error: error.response?.data["message"],
          code: error.response?.statusCode ?? 0,
        );
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.unknown:
      return DataSource.UNKNOWN.getFailure();

    case DioExceptionType.badCertificate:
      return DataSource.BADCERTIFCAITE.getFailure();
    default:
      return DataSource.DEFAULT.getFailure();
  }
}

Failure getKnownErrors({
  required String error,
  required int code,
}) {
  switch (error) {
    case 'The selected phone is invalid.':
      return Failure(
          ResponseCode.DEFAULT, "The selected phone is invalid.");
    default:
      return Failure(code, error ?? "");
  }
}

enum DataSource {
  SUCCESS,
  invalide,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
  UNKNOWN,
  BADCERTIFCAITE
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(
            ResponseCode.SUCCESS, "success");

      case DataSource.invalide :
        return Failure(
            ResponseCode.invalid, "invalid");
      case DataSource.NO_CONTENT:
        return Failure(
            ResponseCode.NO_CONTENT, "success");
      case DataSource.BAD_REQUEST:
        return Failure(
            ResponseCode.BAD_REQUEST, "Bad Request");
      case DataSource.FORBIDDEN:
        return Failure(
            ResponseCode.FORBIDDEN, "FORBIDDEN");
      case DataSource.UNAUTORISED:
        return Failure(
            ResponseCode.UNAUTORISED, "UNAUTORISED");
      case DataSource.NOT_FOUND:
        return Failure(
            ResponseCode.NOT_FOUND, "NOT_FOUND");
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            "INTERNAL_SERVER_ERROR");
      case DataSource.CONNECT_TIMEOUT:
        return Failure(ResponseCode.CONNECT_TIMEOUT,
            "CONNECT_TIMEOUT");
      case DataSource.CANCEL:
        return Failure(
            ResponseCode.CANCEL, "CANCEL");
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(ResponseCode.RECIEVE_TIMEOUT,
           "RECIEVE_TIMEOUT");
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT,
            "RECIEVE_TIMEOUT");
      case DataSource.CACHE_ERROR:
        return Failure(
            ResponseCode.CACHE_ERROR, "CACHE_ERROR");
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
           "NO_INTERNET_CONNECTION");
      case DataSource.DEFAULT:
        return Failure(
            ResponseCode.DEFAULT, "حدث خطأ ما");
      case DataSource.UNKNOWN:
        return Failure(
            ResponseCode.DEFAULT, "يرجى إعادة المحاولة");
      case DataSource.BADCERTIFCAITE:
        return Failure(
            ResponseCode.DEFAULT, "لقد حدث خطأ ما");
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200;     // success with data
  static const int invalid = 402;     // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403;     //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404;        // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = AppStrings.strSuccess; // success with data
  static const String NO_CONTENT =
      AppStrings.strSuccess; // success with no data (no content)
  static const String BAD_REQUEST =
      AppStrings.strBadRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      AppStrings.strUnauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      AppStrings.strForbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.strInternalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      AppStrings.strNotFoundError; // failure, crash in server side
  static const String BADCERTIFCAITE =
      AppStrings.strBadCertificate; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = AppStrings.strTimeoutError;
  static const String CANCEL = AppStrings.strDefaultError;
  static const String RECIEVE_TIMEOUT = AppStrings.strTimeoutError;
  static const String SEND_TIMEOUT = AppStrings.strTimeoutError;
  static const String CACHE_ERROR = AppStrings.strCacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.strNoInternetError;
  static const String DEFAULT = AppStrings.strDefaultError;
  static const String UNKNOWN = AppStrings.strUnknownError;
}

class ResponseErrorKnown {
  static const String LOGIN_FAILED = AppStrings.strLoginFail;
  static const String PASSWORD_MUST_CHANGED = AppStrings.strPasswordMustChange;
}

class ApiInternalStatus {
  static const int SUCCESS = 200;
  static const int FAILURE = 400;
}
