import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:suiyu_frontend/config/app_colors.dart';
import 'package:suiyu_frontend/config/app_images_path.dart';
import 'package:suiyu_frontend/main.dart';
import 'package:suiyu_frontend/views/auth/widgets/login_form_widget.dart';
import 'package:suiyu_frontend/views/auth/widgets/register_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 布尔值，用于切换登录和注册表单
  bool isLoginForm = true;
  bool isLogin = true;
  // 切换表单类型的方法
  void toggleFormType() {
    setState(() {
      isLoginForm = !isLoginForm;
    });
  }

  void changeLogin() {
    setState(() {
      isLogin = true;
      isLoginForm = true;
    });
  }

  void changeRegister() {
    setState(() {
      isLogin = false;
      isLoginForm = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImagesPath.loginRegisterBg),
          fit: BoxFit.cover, // 让图片充满整个容器
        ),
      ),
      child: Row(
        children: [
          // 左侧空白区域
          Expanded(
            child: Container(
              child: const Center(
                child: Text(
                  '欢迎使用应用！',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),

          // 右侧表单区域
          Container(
            width: 500,
            color: Color.fromARGB(98, 255, 255, 255),
            child: Center(
              child: Container(
                height: 600, //------待处理
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'welcomeMessage'.tr(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      //height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          // 登录或注册表单组件
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: changeLogin,
                                    child: Text(
                                      "用户登录",
                                      style: isLogin
                                          ? TextStyle(
                                              color: AppColors.mainColor)
                                          : TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  TextButton(
                                    onPressed: changeRegister,
                                    child: Text(
                                      "立即注册",
                                      style: isLogin
                                          ? TextStyle(color: Colors.black)
                                          : TextStyle(
                                              color: AppColors.mainColor),
                                    ),
                                  ),
                                ],
                              ),
                              isLoginForm
                                  ? LoginFormWidget()
                                  : RegisterFormWidget(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 切换表单按钮
                    // TextButton(
                    //   onPressed: toggleFormType,
                    //   child: Text(
                    //     isLoginForm
                    //         ? 'notAccountTip'.tr()
                    //         : 'hasAccountTip'.tr(),
                    //     style:
                    //         const TextStyle(fontSize: 16, color: Colors.blue),
                    //   ),
                    // ),

                    // ElevatedButton(
                    //   onPressed: () {
                    //     context.setLocale(const Locale('zh', 'CN'));
                    //   },
                    //   child: const Text("切换到中文"),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     context.setLocale(const Locale('en', 'US'));
                    //   },
                    //   child: const Text("Switch to English"),
                    // ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
