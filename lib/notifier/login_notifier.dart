import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:suiyu_frontend/core/constants/app_consts.dart';
import 'package:suiyu_frontend/models/user_info_save_model.dart';
import 'package:suiyu_frontend/services/auth/login_auth_service.dart';

import '../../../utils/storage.dart';

// 登录状态管理器
class LoginNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final LoginAuthservice loginAuthservice;

  // 构造函数，接收 LoginAuthservice
  LoginNotifier(this.loginAuthservice) : super(const AsyncValue.loading()) {
    _loadUserInfo(); // 初始化时加载用户信息
  }

  // 加载本地存储的用户信息
  Future<void> _loadUserInfo() async {
    try {
      final userInfo = StorageUtil().getJSON(AppConsts.saveUserInfo) ?? {};
      state = AsyncValue.data(userInfo);
    } catch (e) {
      state = const AsyncValue.error('加载用户信息失败', StackTrace.empty);
    }
  }

  // 登录方法
  Future<void> login(String username, String password, String code) async {
    state = const AsyncValue.loading(); // 设置为加载中状态

    try {
      // 调用 LoginAuthservice 进行登录请求
      final result = await loginAuthservice.login(username, password, code);

      // 登录成功后更新状态
      state = AsyncValue.data(result);

      // 如果登录成功，保存用户信息到本地（如果需要）
      StorageUtil().setJSON(AppConsts.saveUserInfo, result);
    } catch (e) {
      // 登录失败时捕获异常并更新状态
      state = const AsyncValue.error('登录失败，请检查用户名或密码', StackTrace.empty);
    }
  }

  // 注册方法（如果有需要的话）
  Future<void> register(String username, String password, String email) async {
    state = const AsyncValue.loading(); // 设置为加载中状态

    try {
      // 调用 LoginAuthservice 进行注册请求
      final result = await loginAuthservice.register(username, password, email);

      // 注册成功后更新状态
      state = AsyncValue.data(result);
    } catch (e) {
      // 注册失败时捕获异常并更新状态
      state = const AsyncValue.error('注册失败，请稍后再试', StackTrace.empty);
    }
  }

  // @override
  // Map<String, dynamic> build() => loadUserInfo();

  Map<String, dynamic> loadUserInfo() {
    final map = StorageUtil().getJSON(AppConsts.saveUserInfo);
    return map ?? {}; // 防止返回 null
  }

  Future<void> loginSaveLocal(BuildContext mContext, String username,
      String password, bool rememberPassword, String code) async {
    print(
        "获取的用户名：$username,, 密码：$password,,,,记住密码： $rememberPassword,,,,code: $code");

    if (rememberPassword) {
      final userInfo = UserInfo(
          username: username,
          password: password,
          rememberPassword: rememberPassword);
      await StorageUtil().setJSON(AppConsts.saveUserInfo, userInfo.toJson());
    }
    mContext.go("/home"); // 跳转到首页
    // }
  }

  Future<void> loginInfoClear (BuildContext mContext, String userInfoKey) async {
    //没勾选记住密码就删除本地数据
    await StorageUtil().remove(AppConsts.saveUserInfo);
  }
}
