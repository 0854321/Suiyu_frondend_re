import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiyu_frontend/notifier/login_notifier.dart';
import 'package:suiyu_frontend/providers/api_service_provider.dart';
import 'package:suiyu_frontend/services/api_service.dart';
import 'package:suiyu_frontend/services/auth/login_auth_service.dart';


//管理loginNotifier状态
// 登录服务的 Provider
final loginAuthserviceProvider = Provider<LoginAuthservice>((ref) {
  final apiService = ref.read(apiServiceProvider); // 获取 ApiService
  return LoginAuthservice(apiService); // 返回 LoginAuthservice 实例
});

// 登录 Notifier 的 Provider
final loginProvider = StateNotifierProvider<LoginNotifier, AsyncValue<Map<String, dynamic>>>((ref) {
  return LoginNotifier(ref.read(loginAuthserviceProvider)); // 创建 LoginNotifier
});



//final loginProvider = NotifierProvider<LoginNotifier, Map<String, dynamic>>(LoginNotifier.new);

