import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiyu_frontend/config/app_colors.dart';
import 'package:suiyu_frontend/config/app_dart_colors.dart';
import 'package:suiyu_frontend/config/app_images_path.dart';
import 'package:suiyu_frontend/config/language_service.dart';
import 'package:suiyu_frontend/core/constants/app_iamge_assets.dart';
import 'package:suiyu_frontend/main.dart';
import 'package:suiyu_frontend/models/user_info_save_model.dart';
import 'package:suiyu_frontend/providers/language_provider.dart';
import 'package:suiyu_frontend/providers/login_provider.dart';
import 'package:suiyu_frontend/providers/theme/theme_provider.dart';
import 'package:suiyu_frontend/views/auth/widgets/login_form_widget.dart';
import 'package:suiyu_frontend/views/auth/widgets/register_form_widget.dart';
import 'package:suiyu_frontend/views/common/language_switch_widget.dart';
import 'package:window_manager/window_manager.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool themeDark = ref.watch(themeNotifier);
    String locale = ref.watch(languageProvider).languageCode;
    var isLogin = true;

    final userInfoFuture = ref.watch(loginProvider);

    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isRememberPwdSelected = useState(false); //记住密码选项

    final isLoginForm = useState(true);
    //初始化时运行一次
    useEffect(() {
      if (userInfoFuture.isNotEmpty) {
        UserInfo mUserInfo = UserInfo.fromJson(userInfoFuture);
        if (mUserInfo.rememberPassword == true) {
          usernameController.text = mUserInfo.username;
          passwordController.text = mUserInfo.password;
          isRememberPwdSelected.value = mUserInfo.rememberPassword;
        }
      }
      return null;
    }, []);

    return DragToMoveArea(
        child: Scaffold(
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
              child: Center(
                child: Text(
                  languageService.translate('login_title', locale: locale),
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),

          // 右侧表单区域
          Container(
            width: 500,
            color: const Color.fromARGB(98, 255, 255, 255),
            child: Center(
              child: Container(
                width: 450, //------待处理
                // padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //应用名字
                    Text(
                      languageService.translate('login_title', locale: locale),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          color: themeDark
                              ? AppDarkColors.fontColor
                              : AppColors.fontColorBlack),
                    ),
                    const SizedBox(height: 20),
                    //中英文切换
                    const LanguageSwitchWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    //登陆卡片
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
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        isLoginForm.value = true;
                                      },
                                      child: Text(
                                        languageService.translate('user_login',
                                            locale: locale),
                                        style: isLoginForm.value
                                            ? const TextStyle(
                                                color: AppColors.mainColor)
                                            : const TextStyle(
                                                color: Colors.black),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        isLoginForm.value = false;
                                      },
                                      child: Text(
                                        languageService.translate(
                                            'register_now',
                                            locale: locale),
                                        style: isLoginForm.value
                                            ? const TextStyle(
                                                color: Colors.black)
                                            : const TextStyle(
                                                color: AppColors.mainColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              isLoginForm.value
                                  ? LoginFormWidget()
                                  : RegisterFormWidget(),
                              // const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 0, 25, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: InkWell(
                                          onTap: () {
                                            isRememberPwdSelected.value = !isRememberPwdSelected.value;
                                            print(isRememberPwdSelected);
                                          },
                                            child: Row(
                                      children: [
                                        Image.asset(
                                          !isRememberPwdSelected.value
                                              ? AppImageAssets.iconNotSelect
                                              : AppImageAssets.iconSelectPwd,
                                          width: 20,
                                        ),
                                        Text(
                                          languageService.translate(
                                              'remember_password',
                                              locale: locale),
                                        )
                                      ],
                                    ))),
                                    Container(
                                      child: Text(
                                        languageService.translate(
                                            'forgot_password',
                                            locale: locale),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    )));
  }
}
