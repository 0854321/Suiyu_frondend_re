import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiyu_frontend/config/app_colors.dart';
import 'package:suiyu_frontend/core/constants/app_consts.dart';
import 'package:suiyu_frontend/core/constants/app_iamge_assets.dart';
import 'package:suiyu_frontend/main.dart';
import 'package:suiyu_frontend/models/user_info_save_model.dart';
import 'package:suiyu_frontend/notifier/login_notifier.dart';
import 'package:suiyu_frontend/providers/language_provider.dart';
import 'package:suiyu_frontend/providers/login_provider.dart';
import 'package:suiyu_frontend/providers/theme/theme_provider.dart';
import 'package:suiyu_frontend/utils/async_value_utiles.dart';
import 'package:suiyu_frontend/views/auth/login_screen.dart';
import 'package:suiyu_frontend/views/auth/widgets/login_button_widget.dart';
import 'package:suiyu_frontend/views/common/custom_button_widget.dart';
import 'package:suiyu_frontend/views/common/custom_input_field.dart';

//final loginProvider = NotifierProvider<LoginNotifier,AsyncValue<Map<String, dynamic>>(LoginNotifier.new);

// 登录表单组件
class LoginFormWidget extends HookConsumerWidget {
  const LoginFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String locale = ref.watch(languageProvider).languageCode;

    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final codeController = useTextEditingController();
    final isRememberPwdSelected = useState(false);//记住密码选项
    final bool themeDark = ref.watch(themeNotifier);
    
    final userInfoFuture = ref.watch(loginProvider);
    if (userInfoFuture.hasValue) {
      print(userInfoFuture.value);
      UserInfo mUserInfo = UserInfo.fromJson(AsyncValueUtils.unwrapAsyncValue(userInfoFuture));
      usernameController.text = mUserInfo.username;
      passwordController.text = mUserInfo.password;
      //isRememberPwdSelected.value = mUserInfo.rememberPassword;
    }

    print('login 变化了');
    // 监听语言变化
    //final locale = ref.watch(languageProvider); // 如果你使用 Riverpod 管理语言
    return SizedBox(
      width: 500,
      // height: 300,
      //padding: EdgeInsets.all(20),
      //color: Color.fromARGB(219, 224, 13, 13),
      child: Column(
        children: [
          //用户名
          CustomInputField(
            controller: usernameController,
            hintText: languageService.translate('please_input_user_name',
                locale: locale),
            icon: AppImageAssets.iconUser,
            height: 50,
            width: 400,
          ),
          const SizedBox(height: 10),
          //密码
          CustomInputField(
            controller: passwordController,
            hintText:
                languageService.translate('please_input_pwd', locale: locale),
            icon: AppImageAssets.iconPwd,
            width: 400,
            height: 50,
          ),
          const SizedBox(height: 10),
          //验证码
          Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomInputField(
                    controller: codeController,
                    hintText: languageService.translate('please_input_code',
                        locale: locale),
                    icon: AppImageAssets.iconCode,
                    width: 200,
                    height: 50,
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.w),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(
                              0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      "3478",
                      style:
                          TextStyle(color: AppColors.mainColor, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 25, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    isRememberPwdSelected.value =
                        !isRememberPwdSelected.value;
                    print(isRememberPwdSelected.value);
                  },
                  hoverColor: Colors.deepPurpleAccent[50],
                  child: Row(
                    children: [
                      Image.asset(
                        !isRememberPwdSelected.value
                            ? AppImageAssets.iconNotSelect
                            : AppImageAssets.iconSelectPwd,
                        width: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        languageService.translate('remember_password',
                            locale: locale),
                        style: TextStyle(color: AppColors.mainColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: InkWell(
                      onTap: () {
                        print("按下了忘记密码");
                      },
                      focusColor: AppColors.mainColor,
                      child: Text(
                        languageService.translate(
                          'forgot_password',
                          locale: locale,
                        ),
                        style: TextStyle(
                          color: AppColors.mainColor,
                        ),
                      )),
                ),
              ],
            ),
          ),
          LoginButtonWidget(
            text: languageService.translate('login', locale: locale),
            onPressed: (){ref.read(loginProvider.notifier).loginSaveLocal(
                context,
                usernameController.text,
                passwordController.text,
                isRememberPwdSelected.value,
                codeController.text,
              );
              if(isRememberPwdSelected == false){
                ref.read(loginProvider.notifier).loginInfoClear(context, AppConsts.saveUserInfo);
              }
              print("跳转登录页");},
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
