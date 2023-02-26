import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter_auth/core/base/model/base_view_model.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';
import 'package:flutter_auth/core/init/lang/locale_keys.g.dart';
import 'package:flutter_auth/core/extension/string_extension.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';
part 'password_view_model.g.dart';

class PasswordViewModel = _PasswordViewModelBase with _$PasswordViewModel;

abstract class _PasswordViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
  void navigateToLogin() {
    Navigator.pop(viewModelContext);
  }

  @observable
  bool isLockOpen = false;
  @action
  void isLockChange() {
    isLockOpen = !isLockOpen;
  }

  void showSuccessAlert(BuildContext context, {required String text, required String title}) {
    QuickAlert.show(
      type: QuickAlertType.success,
      context: context,
      text: text,
      title: title,
      backgroundColor: context.colors.background,
      textColor: context.colors.secondary,
      titleColor: context.colors.secondary,
      confirmBtnColor: context.colors.onSecondary,
    );
  }

  void showError(BuildContext context, {required String text, required String title}) {
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
  @override
  void dispose() {
    emailController.dispose();
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      showSuccessAlert(viewModelContext, text: LocaleKeys.alert_check.locale, title: LocaleKeys.alert_sendedMail.locale);
    } catch (e) {
      showError(viewModelContext, text: LocaleKeys.valid_mail.locale, title: LocaleKeys.alert_wrongM.locale);
    }
  }
}
