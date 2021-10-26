import 'package:dio/dio.dart';
import 'package:food_ninja/core/data/clients/api/api_routes.dart';
import 'package:food_ninja/core/data/clients/api/exceptions/api_exception.dart';
import 'package:food_ninja/core/data/clients/skeleton/base_client.dart';
import 'package:food_ninja/core/domain/entities/option/service/options.dart' as domain_options;
import 'api.dart';

class ApiClient extends BaseClient {
  static final Dio _dio = _initDio();

  static Dio _initDio() {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: 'https://${Api.baseUrl}',
      connectTimeout: 3000,
      receiveTimeout: 3000
    );

    final Dio dio = Dio(baseOptions);
    //TODO Доделать исключения. Добавить источник исключения. Разделить на сообщения для пользователя и для системы
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          options.headers[Api.userHashField] = domain_options.Options().apiAuthToken;

          return handler.next(options);
        },
        onResponse:(response,handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          throw ApiException('Не удалось установить соединение');
        }
    ));

    return dio;
  }


  Future register({
    required String email,
    required String password,
    String login = '',
    String? emailVerifyCode
  }) async {

    final Map<String, String> body = {
      'email': email,
      'password': password,
    };

    if(emailVerifyCode != null) {
      body['checkCode'] = emailVerifyCode;
    }

    return _dio.post(ApiRoutes.register,
        data: body
    );
  }

  Future authorize({required String email, required String password}) async {
    final Map<String, String> body = {
      'email': email,
      'password': password,
    };

    return _dio.post(ApiRoutes.authorize,
      data: body,
    );
  }

  Future sendAccessRecoveryEmailCode({required String email}) async {
    final Map<String, String> body = {
      'email': email,
    };

    return _dio.post(ApiRoutes.access_recovery,
        data: body,
    );
  }

  Future checkAccessRecoveryResetCode({required String email, required String code}) async {
    final Map<String, String> body = {
      'email': email,
      'code': code
    };

    print(body);

    return _dio.post(ApiRoutes.check_reset_password_code,
      data: body,
    );
  }

  Future createNewPassword({required String email, required String code, required String password}) async {
    final Map<String, String> body = {
      'email': email,
      'password': password,
      'code': code
    };

    return _dio.post(ApiRoutes.new_password,
      data: body,
    );
  }

  Future isAuthorized() async {
    return _dio.post(ApiRoutes.is_authorized);
  }

  Future restaurants() async {
    return _dio.get(ApiRoutes.restaurants);
  }
}