import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:suiyu_frontend/views/auth/login_page.dart';

import 'config/window_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //初始化窗口配置
  await WindowConfig.initialize();
  // 如果你想根据屏幕比例设置窗口大小，可以调用 setWindowSize 方法
  await WindowConfig.setWindowSize();
  //初始化i18n
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en','US'),
        Locale('zh','CN'),
      ], 
      path: "assets/translations",
      fallbackLocale: const Locale('zh','CN'),
      child: MyApp(), 
    )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //配置 GoRouter 路由
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginPage(),
      )
    ]
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //设计稿中设备的屏幕尺寸，单位dp
      designSize: const Size(1280, 720),
      minTextAdapt: true,//是否根据宽度/高度中的最小值适配文字
      splitScreenMode: true, //支持分屏尺寸

      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: _router,  // 使用 GoRouter

          //指定本地化设置
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          title: 'Flutter 应用示例',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        );
      },
    ); 
  }
}
