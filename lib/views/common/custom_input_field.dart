import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiyu_frontend/config/app_colors.dart';
import 'package:suiyu_frontend/config/app_dart_colors.dart';
import 'package:suiyu_frontend/providers/theme/theme_provider.dart';

class CustomInputField extends HookConsumerWidget{
  final String hintText;
  final String icon;
  final bool obscureText;
  final double? width;
  final double? height;
  final Function(String)? onChanged;
  final TextEditingController? controller; // 新增 controller 参数

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.onChanged,
    this.controller, // 允许传入 controller
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool themeDark = ref.watch(themeNotifier);
    print("themeDark => $themeDark");
    return Container(
      padding: const EdgeInsets.only(left: 16),
      constraints: BoxConstraints.expand(
        width: width ?? 431,
        height: height ?? 68,
      ),
      decoration: BoxDecoration(
        color: themeDark ? AppDarkColors.backgroundColor : AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ]
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 20,
            //height: 18.w,
          ),
          const SizedBox(
            width: 23,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              onChanged: onChanged,

              decoration: InputDecoration(
                fillColor: const Color.fromARGB(137, 90, 90, 90),
                hintText: hintText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            )
          )
        ],
      ),
    );
  }

}