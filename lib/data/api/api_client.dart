import 'package:dio/dio.dart';
import 'package:okoshki/data/services/snackbar_service.dart';
import 'package:okoshki/data/services/storage_service.dart';
import 'package:okoshki/data/api/endpoints.dart';
import 'package:okoshki/data/services/toast_service.dart';
import 'package:okoshki/internal/router/app_router.dart';
import 'package:okoshki/internal/utils/sl.dart';

class ApiClient {
  final Dio _dio;
  final StorageService _storage;

  const ApiClient({
    required Dio dio,
    required StorageService storageService,
  })  : _dio = dio,
        _storage = storageService;

  Dio get dio => _dio;

  void initDio() {
    _dio.interceptors.addAll(
      [
        LogInterceptor(
          error: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
        ),
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (!EndPoints.withoutToken.contains(options.path)) {
              final authToken = _storage.getToken;
              if (authToken != null) {
                options.headers['Authorization'] = 'Token $authToken';
              }
            }
            final isSaloon = _storage.getIsSaloon;
            if (isSaloon) {
              options.headers['isSalon'] = '_';
            }
            handler.next(options);
          },
          onResponse: (response, handler) {
            final path = response.requestOptions.path;
            final body = response.requestOptions.data;
            final res = response.data;

            if (path == EndPoints.logout) {
              _storage.setToken = null;
            } else if (path == EndPoints.authorize) {
              final token = res['auth_token'];
              _storage.setToken = token;
              final email = body['email'];
              final password = body['password'];
              _storage.setIsSaloon = email != null && password != null;
            }

            return handler.next(response);
          },
          onError: (error, handler) {
            final res = error.response?.data;
            final code = error.response?.statusCode;
            final path = error.requestOptions.path;
            final userBlocked = res['user_blocked'];

            String errorMessage = 'Неизвестная ошибка';

            if (res['non_field_errors'] != null) {
              errorMessage = res['non_field_errors'][0];
            }
            if (res['detail'] != null) {
              errorMessage = res['detail'];
            }

            // cutting out token from path: from auth/check_token/token_here/ to auth/check_token/
            if ('${path.split('/').getRange(0, 2).join('/')}/' ==
                EndPoints.checkToken) {
              return handler.next(error.copyWith(message: errorMessage));
            }

            if (userBlocked == 'True') {
              _storage.setToken = null;
              sl<SnackbarService>().showUserBlocked();
              sl<AppRouter>().replaceAll([const AuthCustomerRoute()]);
            }

            if (code != null) {
              // idk if nullable code can appear here, but lets handle it
              //sl<SnackbarService>().showRequestError(code, errorMessage);
              ToastService.showToast(errorMessage);
            }

            return handler.next(error.copyWith(message: errorMessage));
          },
        ),
      ],
    );
  }
}
