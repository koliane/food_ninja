import 'package:dio/dio.dart';
import 'package:food_ninja/core/data/clients/api/api_routes.dart';
import 'package:food_ninja/core/data/clients/api/exceptions/api_exception.dart';
import 'package:food_ninja/core/data/clients/skeleton/base_client.dart';
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
    //TODO Доделать
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          options.headers[Api.userHashField] = 'asd';
          // Do something before request is sent
          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onResponse:(response,handler) {
          // Do something with response data
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onError: (DioError e, handler) {
          throw ApiException('Не удалось установить соединение');
          // Do something with response error
          // return  handler.next(e);//continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
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

    Response? response;
    try {
      response = await _dio.post(ApiRoutes.register,
          data: body
      );
    } on DioError catch(e) {
      print(e);
      throw ApiException('Не удалось установить соединение');
    }

    return response;
  }

  Future authorize({required String email, required String password}) async {
    final Map<String, String> body = {
      'email': email,
      'password': password,
    };

    Response? response;
    try {
      response = await _dio.post(ApiRoutes.authorize,
        data: body,
        // options: Options (
        //   headers: {"appusertoken": "lalala"},
        // )
      );
    } on DioError catch(e) {
      print(e.stackTrace);
      rethrow;
      // throw ApiException('Не удалось установить соединение');
    }

    print(response.toString());
    return response;
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
}