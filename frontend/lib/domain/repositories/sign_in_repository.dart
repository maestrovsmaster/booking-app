
import 'package:frontend/data/models/app_token.dart';
import 'package:frontend/data/models/app_user.dart';


import 'package:dio/dio.dart';
import 'package:frontend/data/net/result.dart';



class SignInRepository {
  final Dio _dio;

  SignInRepository(this._dio);



  Future<Result<AppToken?, String>> registerUser(String name, String email, String password) async {

    try {

      final response = await _dio.post(
        '/api/auth/register',
        data:  {
          "name": name,
          "email": email,
          "password": password,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      print("registerUser response = $response");

      if (response.statusCode == 200 && response.data != null) {
        return Result.success(AppToken.fromJson(response.data));
      }else {
        return Result.failure("Server returned an error: ${response.statusCode}");
      }
    } catch (e) {
      print('Error registerUser: $e');
      return Result.failure("Network error: $e");
    }

  }


  Future<Result<AppToken?, String>> signIn( String email, String password) async {

    try {

      final response = await _dio.post(
        '/api/auth/login',
        data:  {
          "email": email,
          "password": password,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      print("signIn response = $response");

      if (response.statusCode == 200 && response.data != null) {
        return Result.success(AppToken.fromJson(response.data));
      }else {
        return Result.failure("Server returned an error: ${response.statusCode}");
      }
    } catch (e) {
      print('Error signIn: $e');
      return Result.failure("Network error: $e");
    }

  }


}


