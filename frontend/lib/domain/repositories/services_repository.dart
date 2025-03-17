
import 'package:dio/dio.dart';
import 'package:frontend/data/net/result.dart';

import '../../data/models/service.dart';



class ServicesRepository {
  final Dio _dio;

  ServicesRepository(this._dio);

  Future<Result<List<Service>?, String>> getServices() async {
    try {
      final response = await _dio.get(
        '/api/services',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      print("getServices = $response");

      if (response.statusCode == 200 && response.data != null) {
        return Result.success([]);//Result.success(Service.fromJson(response.data));
      }else {
        return Result.failure("getServices error: ${response.statusCode}");
      }
    } catch (e) {
      print('Error getServices: $e');
      return Result.failure("Network error: $e");
    }

  }




  Future<Result<bool, String>> createService(Service service) async {

    try {

      final response = await _dio.post(
        '/api/services',
        data: service.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      print("createService response = $response");

      if (response.statusCode == 200 && response.data != null) {
        return Result.success(true);
      }else {
        return Result.failure("Server returned an error: ${response.statusCode}");
      }
    } catch (e) {
      print('Error registerUser: $e');
      return Result.failure("Network error: $e");
    }

  }




}


