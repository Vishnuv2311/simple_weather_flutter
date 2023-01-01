import 'package:freezed_annotation/freezed_annotation.dart';
import 'app_exception.dart';

part 'api_response.freezed.dart';

@freezed
class APIResponse<T> with _$APIResponse<T> {
  const factory APIResponse.success(List<String> value) = APISuccess<T>;

  const factory APIResponse.loading() = Loading;

  const factory APIResponse.initial() = Initial;

  const factory APIResponse.error(AppException exception) = APIError;
}