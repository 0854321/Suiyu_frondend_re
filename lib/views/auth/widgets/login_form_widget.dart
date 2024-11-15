import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suiyu_frontend/core/constants/app_iamge_assets.dart';
import 'package:suiyu_frontend/views/auth/login_page.dart';
import 'package:suiyu_frontend/views/common/custom_input_field.dart';

// 登录表单组件
class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  _LoginFormWidget createState()=> _LoginFormWidget();

}

class _LoginFormWidget extends State<LoginFormWidget> {
  String usernameInput = '';
  String passwordInput = '';
  @override
  Widget build(BuildContext context) {
    String usernameTr = 'username'.tr();
    String passwordTr = 'password'.tr();
    String authCode = 'authCode'.tr();
    print('login 变化了');
    return Container(
      width: 500,
      height: 300,
      //padding: EdgeInsets.all(20),
      //color: Color.fromARGB(219, 224, 13, 13),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: usernameTr),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(labelText: passwordTr),
            obscureText: true,
          ),
          CustomInputField(hintText: usernameTr, icon: AppImageAssets.iconPwd),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.check_box_outline_blank),
                  Text("记住密码"),
                ],
              ),
              Text("忘记密码")
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              fixedSize: Size.fromWidth(400),
            ),
            onPressed: () {
              // 执行登录逻辑
            },
            child: const Text('登录'),
          ),
        ],
      ),
    );
  }
  
}