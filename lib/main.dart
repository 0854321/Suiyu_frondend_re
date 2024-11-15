import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:suiyu_frontend/providers/go_router_provider.dart';
import 'package:suiyu_frontend/providers/language_provider.dart';
import 'package:suiyu_frontend/views/auth/login_screen.dart';

import 'config/window_config.dart';

// 定义 languageProvider 来管理语言状态
//final languageProvider = StateProvider<Locale>((ref) => const Locale('zh', 'CN'));  // 默认英语


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //初始化窗口配置
  await WindowConfig.initialize();
  // 如果你想根据屏幕比例设置窗口大小，可以调用 setWindowSize 方法
  await WindowConfig.setWindowSize();
  //初始化i18n
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en','US'),
          Locale('zh','CN'),
        ], 
        path: "assets/translations",
        fallbackLocale: const Locale('zh','CN'),
        child: MyApp(), 
      ),
    )
  );
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  //配置 GoRouter 路由
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      )
    ]
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final locale = ref.watch(languageProvider);
    return ScreenUtilInit(
      //设计稿中设备的屏幕尺寸，单位dp
      designSize: const Size(1280, 720),
      minTextAdapt: true,//是否根据宽度/高度中的最小值适配文字
      splitScreenMode: true, //支持分屏尺寸
      builder: (context, child) {

        return MaterialApp.router(
          routerConfig: goRouter,  // 使用 GoRouter
          //指定本地化设置
          localizationsDelegates: context.localizationDelegates,

          locale: locale, //使用全球化
          supportedLocales: const [  
            Locale('en', 'US'),  Locale('zh', 'CN'),
          ],

          title: 'Flutter 应用示例',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        );
      },
    ); 
  }
}
