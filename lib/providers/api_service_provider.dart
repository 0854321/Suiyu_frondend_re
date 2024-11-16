// 确保路径正确
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiyu_frontend/services/api_service.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();  // 创建一个 Dio 实例
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.read(dioProvider);  // 获取 Dio 实例
  return ApiService(dio);  // 将 Dio 实例传入 ApiService
});