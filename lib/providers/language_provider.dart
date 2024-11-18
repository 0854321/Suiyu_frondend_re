import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiyu_frontend/core/config/language_service.dart';
import 'package:suiyu_frontend/core/constants/app_consts.dart';
import 'package:suiyu_frontend/utils/storage.dart';

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>((ref) {
  return LanguageNotifier(
      Locale(StorageUtil().getString(AppConsts.saveLanguage) ?? 'zh'));
});
final languageService = LanguageService();

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier(super.state);
  // 设置语言
  Future<void> setLocale(Locale locale) async {
    state = locale;
    await StorageUtil().setValue(AppConsts.saveLanguage, locale.languageCode);
  }
}
