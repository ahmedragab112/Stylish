import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stylehub/core/error/error_handler.dart';
part 'api_response.freezed.dart';

@Freezed()
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.data(T data) = Success<T>;
  const factory ApiResponse.error({required ErrorHandler errorHandler}) =
      Fail<T>;
}
