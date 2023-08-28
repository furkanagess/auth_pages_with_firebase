import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:quickalert/quickalert.dart';

import 'package:flutter_auth/core/base/model/base_view_model.dart';
import 'package:flutter_auth/core/constants/navigation/navigation_constants.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';
import 'package:flutter_auth/core/extension/string_extension.dart';
import 'package:flutter_auth/core/init/lang/locale_keys.g.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}

  void navigateToSignup() {
    navigation.navigateToPage(path: NavigationConstants.SIGNUP_VIEW);
  }

  @observable
  bool isLockOpen = false;
  @action
  void isLockChange() {
    isLockOpen = !isLockOpen;
  }

  void navigateToPassword() {
    navigation.navigateToPage(path: NavigationConstants.PASSWORD_VIEW);
  }

  void showError(BuildContext context,
      {required String text, required String title}) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: text,
      title: title,
      backgroundColor: context.colors.background,
      textColor: context.colors.secondary,
      titleColor: context.colors.secondary,
      confirmBtnColor: context.colors.onSecondary,
    );
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException {
      showError(
        viewModelContext,
        text: LocaleKeys.alert_validMP.locale,
        title: LocaleKeys.alert_wrongMP.locale,
      );
    }
  }
}
