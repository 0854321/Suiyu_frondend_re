import 'package:hooks_riverpod/hooks_riverpod.dart';

// 登录表单状态
class LoginFormState {
  final String username;
  final String password;
  final String code;
  final bool isRememberPassword;
  final String? usernameError;
  final String? passwordError;
  final String? codeError;

  LoginFormState({
    this.username = '',
    this.password = '',
    this.code = '',
    this.isRememberPassword = false,
    this.usernameError,
    this.passwordError,
    this.codeError,
  });

  LoginFormState copyWith({
    String? username,
    String? password,
    String? code,
    bool? isRememberPassword,
    String? usernameError,
    String? passwordError,
    String? codeError,
  }) {
    return LoginFormState(
      username: username ?? this.username,
      password: password ?? this.password,
      code: code ?? this.code,
      isRememberPassword: isRememberPassword ?? this.isRememberPassword,
      usernameError: usernameError ?? this.usernameError,
      passwordError: passwordError ?? this.passwordError,
      codeError: codeError ?? this.codeError,
    );
  }
}

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier() : super(LoginFormState());

  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setCode(String code) {
    state = state.copyWith(code: code);
  }

  void setRememberPassword(bool value) {
    state = state.copyWith(isRememberPassword: value);
  }

  void reset() {
    state = LoginFormState();
  }
}

final loginFormProvider =
    StateNotifierProvider<LoginFormNotifier, LoginFormState>((ref) {
  return LoginFormNotifier();
});
