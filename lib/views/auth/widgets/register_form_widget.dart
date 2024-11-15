// 注册表单组件
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suiyu_frontend/config/app_colors.dart';
import 'package:suiyu_frontend/core/constants/app_iamge_assets.dart';
import 'package:suiyu_frontend/views/common/custom_input_field.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  _RegisterFormWidget createState()=> _RegisterFormWidget();

}

class _RegisterFormWidget extends State<RegisterFormWidget> 
{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //用户名
        CustomInputField(hintText: "用户名", icon: AppImageAssets.iconPwd, width: 400, height: 50,),
        const SizedBox(height: 10),
        //手机号
        CustomInputField(hintText: "手机号", icon: AppImageAssets.iconPwd, width: 400, height: 50,),
        const SizedBox(height: 10),
        //手机号
        CustomInputField(hintText: "密码", icon: AppImageAssets.iconPwd, width: 400, height: 50,),
        const SizedBox(height: 10),
        //验证码
        Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomInputField(
                    hintText: "验证码",
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
                          color: AppColors.mainColor, fontSize: 20.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]),
          ),
        const SizedBox(height: 20),
        //手机验证码
        ElevatedButton(
          onPressed: () {
            // 执行注册逻辑
          },
          child: const Text('注册'),
        ),
      ],
    );
  }
}