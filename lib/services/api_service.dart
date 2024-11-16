import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> post(String path, Map<String, dynamic> data) async {
    try {
      final response = await dio.post(path, data: data);
      if (response.statusCode == 200) {
        return response.data; // 成功返回数据
      } else {
        throw Exception('请求失败：${response.statusMessage}');
      }
    } on DioException catch (e) {
      _handleDioError(e); // 处理错误
      rethrow;
    }
  }

  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(path, queryParameters: params);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('请求失败：${response.statusMessage}');
      }
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  void _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      print('连接超时');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      print('响应超时');
    } else if (e.type == DioExceptionType.badResponse) {
      print('服务器返回错误: ${e.response?.statusCode}');
    } else {
      print('未知错误: $e');
    }
  }
}
