// 注册表单组件
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiyu_frontend/config/app_colors.dart';
import 'package:suiyu_frontend/core/constants/app_iamge_assets.dart';
import 'package:suiyu_frontend/notifier/register_notifier.dart';
import 'package:suiyu_frontend/providers/language_provider.dart';
import 'package:suiyu_frontend/views/common/custom_input_field.dart';

class RegisterFormWidget extends HookConsumerWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String locale = ref.watch(languageProvider).languageCode;

    // final registrationNotifier = ref.read(registrationProvider.notifier);
    final usernameController = useTextEditingController();
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();
    final codeController = useTextEditingController();

    return Column(
      children: [
        //用户名
        CustomInputField(
          controller: usernameController,
          hintText: languageService.translate("user_name", locale: locale),
          icon: AppImageAssets.iconUser,
          width: 400,
          height: 50,
        ),
        const SizedBox(height: 10),
        //密码
        CustomInputField(
          controller: passwordController,
          hintText: languageService.translate('password', locale: locale),
          icon: AppImageAssets.iconPwd,
          width: 400,
          height: 50,
        ),
        const SizedBox(height: 10),
        //手机号
        CustomInputField(
          controller: phoneController,
          hintText: languageService.translate('phone_number', locale: locale),
          icon: AppImageAssets.iconPhone,
          width: 400,
          height: 50,
        ),
        const SizedBox(height: 10),
        //验证码
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomInputField(
              controller: codeController,
              hintText: languageService.translate('phone_code', locale: locale),
              icon: AppImageAssets.iconCode,
              width: 200,
              height: 50,
            ),
          ]),
        ),
        const SizedBox(height: 10),
        //手机验证码
        ElevatedButton(
          onPressed: () {
            // 执行注册逻辑
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          child: Container(
            width: 350,
            height: 60,
            decoration: const BoxDecoration(),
            alignment: Alignment.center,
            child: Text(
              languageService.translate('register', locale: locale),
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextButton(onPressed: () {}, child: Text(languageService.translate('have_account_login',locale: locale)))
      ],
    );
  }
}
