import 'package:dio/dio.dart';
import 'package:food_ninja/core/data/clients/api/api_routes.dart';
import 'package:food_ninja/core/data/clients/skeleton/base_client.dart';
import 'api.dart';

class ApiClient extends BaseClient {
  static final Dio _dio = _initDio();

  static Dio _initDio() {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: 'https://${Api.baseUrl}',
      connectTimeout: 5000,
      receiveTimeout: 3000
    );

    return Dio(baseOptions);
  }


  Future register({
    required String email,
    required String password,
    String? emailVerifyCode
  }) async {

    final Map<String, String> body = {
      'email': email,
      'password': password,
    };
    if(emailVerifyCode != null) {
      body['checkCode'] = emailVerifyCode;
    }

    final Response response = await _dio.post(ApiRoutes.register,
      data: body
    );

    return response;
  }

}