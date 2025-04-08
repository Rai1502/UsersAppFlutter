import 'package:dio/dio.dart';
import 'package:users_app_flutter/domain/errors/app_errors.dart';
import 'package:users_app_flutter/remote/constants/remote_constants.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: RemoteConstants.baseUrl));

  Future<List<dynamic>> get(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
      );
      // Verificamos el status code
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw AppError('Error en la solicitud GET: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw AppError('Error de conexión: ${e.message}');
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
      );
      // Verificamos el status code
      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw AppError('Error en la solicitud POST: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw AppError('Error de conexión: ${e.message}');
    }
  }

  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
      );
      // Verificamos el status code
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw AppError('Error en la solicitud PUT: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw AppError('Error de conexión: ${e.message}');
    }
  }
}
