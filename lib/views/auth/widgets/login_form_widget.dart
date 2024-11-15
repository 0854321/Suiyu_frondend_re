import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiyu_frontend/config/app_colors.dart';
import 'package:suiyu_frontend/core/constants/app_iamge_assets.dart';
import 'package:suiyu_frontend/main.dart';
import 'package:suiyu_frontend/providers/language_provider.dart';
import 'package:suiyu_frontend/views/auth/login_screen.dart';
import 'package:suiyu_frontend/views/common/custom_button_widget.dart';
import 'package:suiyu_frontend/views/common/custom_input_field.dart';

// 登录表单组件
class LoginFormWidget extends ConsumerWidget {
  const LoginFormWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final String locale = ref.watch(languageProvider).languageCode;
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
            hintText: languageService.translate('please_input_user_name', locale: locale),
            icon: AppImageAssets.iconUser,
            height: 50,
            width: 400,
          ),
          const SizedBox(height: 10),
          //密码
          CustomInputField(
            hintText: languageService.translate('please_input_pwd', locale: locale),
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
                    hintText: languageService.translate('please_input_code', locale: locale),
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
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      "3478",
                      style: TextStyle(
                          color: AppColors.mainColor, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]),
          ),
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Row(
          //       children: [
          //         Icon(Icons.check_box_outline_blank),
          //         Text("记住密码"),
          //       ],
          //     ),
          //     Text("忘记密码")
          //   ],
          // ),
          const SizedBox(height: 10),
          //登录按钮
          
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     // shape: const RoundedRectangleBorder(),
          //     fixedSize: const Size.fromWidth(400),
          //   ),
          //   onPressed: () {
          //     // 执行登录逻辑
          //   },
          //   child: const Text('登录'),
          // ),
        ],
      ),
    );
  }
}
