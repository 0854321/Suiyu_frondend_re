import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiyu_frontend/router/go_router_provider.dart';
import 'package:suiyu_frontend/providers/language_provider.dart';
import 'package:suiyu_frontend/features/auth/login_screen.dart';

import 'core/config/window_config.dart';

// 定义 languageProvider 来管理语言状态
//final languageProvider = StateProvider<Locale>((ref) => const Locale('zh', 'CN'));  // 默认英语

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //初始化窗口配置
  await WindowConfig.initialize();
  // 如果你想根据屏幕比例设置窗口大小，可以调用 setWindowSize 方法
  await WindowConfig.setWindowSize();

  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  // //配置 GoRouter 路由
  // final GoRouter _router = GoRouter(routes: [
  //   GoRoute(
  //     path: '/',
  //     builder: (context, state) => const LoginScreen(),
  //   )
  // ]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 使用 ref.watch 监听路由和语言状态
    final goRouter = ref.watch(goRouterProvider);
    final locale = ref.watch(languageProvider);

    return ScreenUtilInit(
      designSize: const Size(1280, 720), // 设计稿尺寸
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp.router(
        routerConfig: goRouter,
        // 本地化配置
        //localizationsDelegates: AppLocalizations.localizationsDelegates,
        // supportedLocales: const [
        //   Locale('zh', 'CN'),
        //   Locale('en', 'US'),
        // ],
        locale: locale,

        title: 'Flutter 应用示例',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // 添加其他主题配置
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
