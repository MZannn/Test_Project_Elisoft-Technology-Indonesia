import 'package:dio/dio.dart';
import 'package:test_project/services/base_api.dart';

class ApiService {
  final API api = API();
  String token = 'lsGPLl4k6Vc4J0VhnFaMBqetNtn1ofsB';

  Future<dynamic> get<T>(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      bool requireToken = false}) async {
    var customHeaders = requireToken
        ? {'Accept': 'application/json', 'Authorization': 'Bearer $token'}
        : {'Accept': 'application/json'};
    if (headers != null) {
      customHeaders.addAll(headers);
    }

    try {
      final response = await api.dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: customHeaders),
      );
      return response.data;
    } on DioException catch (e) {
      throw e.response!.data['message'];
    }
  }

  Future<dynamic> post<T>({
    required String endpoint,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool requireToken = false,
  }) async {
    var customHeaders = requireToken
        ? {'Accept': 'application/json', 'Authorization': 'Bearer $token'}
        : {'Accept': 'application/json'};
    if (headers != null) {
      customHeaders.addAll(headers);
    }
    try {
      final response = await api.dio.post(
        endpoint,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: customHeaders,
        ),
      );
      return response.data;
    } on DioException catch (e) {
      throw e.response!.data['message'];
    }
  }
}
