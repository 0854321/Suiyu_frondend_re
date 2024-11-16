import 'package:suiyu_frontend/services/api_service.dart';

class LoginAuthservice {
  final ApiService apiService;

  LoginAuthservice(this.apiService);

  //登录方法
  Future<Map<String, dynamic>> login(String username, String password, String code) {
    return apiService.post('/login', {
      'username': username,
      'password': password,
      'code': code,
    });
  }
  //注册方法
  Future<Map<String, dynamic>> register(String username, String password, String email) {
    return apiService.post('/register', {
      'username': username,
      'password': password,
      'email': email,
    });
  }
}
