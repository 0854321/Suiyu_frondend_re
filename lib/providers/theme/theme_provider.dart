import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suiyu_frontend/core/constants/app_consts.dart';
import 'package:suiyu_frontend/utils/storage.dart';

final themeNotifier = StateNotifierProvider<ThemeNotifier, bool>((ref){
  return ThemeNotifier(StorageUtil().getBool(AppConsts.saveTheme) ?? false);
});

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier(super.state); //默认不是夜间模式

  void setDart(bool isDark) async {
    state = isDark;
    await StorageUtil().setValue(AppConsts.saveTheme, isDark);
  }
}