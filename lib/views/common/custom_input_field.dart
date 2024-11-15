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
      padding: EdgeInsets.only(left: 16.w),
      constraints: BoxConstraints.expand(
        width: width ?? 431.w,
        height: height ?? 68.h,
      ),
      decoration: BoxDecoration(
        color: themeDark ? AppDarkColors.backgroundColor : AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ]
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 18.w,
            height: 18.w,
          ),
          SizedBox(
            width: 23.w,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              onChanged: onChanged,
              style: TextStyle(fontSize: 18.sp,color: Colors.black),
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 16.h),
              ),
            )
          )
        ],
      ),
    );
  }

}