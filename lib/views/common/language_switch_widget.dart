import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiyu_frontend/providers/language_provider.dart';

class LanguageSwitchWidget extends HookConsumerWidget {
  final String langOne;
  final String langTwo;

  const LanguageSwitchWidget(
      {super.key, this.langOne = "中文", this.langTwo = "英文"});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              ref.read(languageProvider.notifier).setLocale(const Locale('zh'));
              print("切换到中文");
            },
            child: const Text("中文"),
          ),
          const SizedBox(
            width: 20,
          ),
          TextButton(
            onPressed: () {
              ref.read(languageProvider.notifier).setLocale(const Locale('en'));
              print("切换到英文");
            },
            child: const Text("English"),
          ),
        ],
      ),
    );
  }
}
