import 'package:dio/dio.dart';
import 'package:okoshki/domain/entities/api_response.dart';
import 'package:retrofit/dio.dart';

Future<ApiResource<T>> safeApiCall<T>(
  Future<HttpResponse<T>> apiToBeCalled,
) async {
  try {
    final response = await apiToBeCalled;
    return ApiResourceSucces<T>(response.data);
  } on DioException catch (e) {
    return ApiResourceError<T>(e.message);
  }
}
