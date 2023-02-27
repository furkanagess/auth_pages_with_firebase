// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';

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
