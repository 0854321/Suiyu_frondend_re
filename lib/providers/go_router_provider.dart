import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:suiyu_frontend/views/auth/login_screen.dart';
import 'package:suiyu_frontend/views/home/home_screen.dart';

// 定义路由枚举,用于管理所有路由名称
enum AppRoute {
  login,  // 登录路由
  home,   // 首页路由
}

// 路由路径常量类,用于集中管理所有路由路径
class AppRoutes {
  static const login = '/';        // 登录页面路径
  static const home = '/home';     // 首页路径
}

// 全局路由提供者,使用 Provider 来管理路由状态
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',          // 初始路由路径
    debugLogDiagnostics: true,     // 开启路由调试日志
    routes: [
      // 登录页面路由配置
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      // 首页路由配置 
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ]
  );
});
