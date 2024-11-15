// 注册表单组件
import 'package:flutter/material.dart';

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
        TextFormField(
          decoration: const InputDecoration(labelText: '用户名'),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: '邮箱'),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: '密码'),
          obscureText: true,
        ),
        const SizedBox(height: 20),
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