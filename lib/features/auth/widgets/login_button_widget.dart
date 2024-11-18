import 'package:flutter/material.dart';
import 'package:suiyu_frontend/core/config/app_colors.dart';
import 'package:suiyu_frontend/providers/language_provider.dart';

class LoginButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const LoginButtonWidget({
    Key? key,
    this.text = 'btnd',
    required this.onPressed,
    this.width,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()=> onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )
      ),
      child: Container(
        width: 350,
        height: 60,
        decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(8),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.1),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: const Offset(0, 3), // changes position of shadow
          //   ),
          // ],
          // gradient: const LinearGradient(
          //   colors: [
          //     AppColors.mainColor,
          //     AppColors.backgroundColor,
          //   ],
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          // ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
