import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text; // 按钮文本
  final VoidCallback onPressed; // 按钮点击事件
  final Color backgroundColor; // 背景颜色
  final Color textColor; // 文本颜色
  final double borderRadius; // 圆角半径
  final EdgeInsetsGeometry padding; // 按钮内边距

  // 构造函数
  const CustomButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue, // 默认背景颜色为蓝色
    this.textColor = Colors.white, // 默认文本颜色为白色
    this.borderRadius = 8.0, // 默认圆角半径为16.0
    this.padding = const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), // 默认内边距
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, backgroundColor: backgroundColor, // 设置文本颜色
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), // 设置圆角
        ),
        padding: padding, // 设置按钮内边距
      ),
      onPressed: onPressed,
      child: Text(text), // 设置按钮文本
    );
  }
}
