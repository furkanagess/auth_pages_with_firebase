// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_auth/core/widgets/button/custom_button.dart';
import 'package:flutter_auth/core/widgets/text/custom_rich_text.dart';
import 'package:flutter_auth/core/widgets/text/gesture_text.dart';
import 'package:flutter_auth/core/widgets/textField/simple_textfield.dart';
import 'package:flutter_auth/core/widgets/textField/obscure_textfield.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_auth/core/base/view/base_view.dart';
import 'package:flutter_auth/core/constants/svg/svg_constants.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';
import 'package:flutter_auth/core/extension/string_extension.dart';
import 'package:flutter_auth/core/init/lang/locale_keys.g.dart';
import 'package:flutter_auth/view/auth/login/viewModel/login_view_model.dart';

class LoginView extends StatelessWidget {
  final VoidCallback onClickedSignUp;
  const LoginView({super.key, required this.onClickedSignUp});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 5,
                child: buildSVG(),
              ),
              Expanded(
                flex: 2,
                child: buildMailTextField(context, viewModel),
              ),
              Expanded(
                flex: 2,
                child: buildPasswordTextField(context, viewModel),
              ),
              Expanded(
                flex: 2,
                child: loginButton(context, viewModel),
              ),
              Expanded(
                flex: 1,
                child: forgotText(context, viewModel),
              ),
              Expanded(
                flex: 1,
                child: signupRow(context, viewModel),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Row signupRow(BuildContext context, LoginViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(),
        CustomRichText(
          firstSpan: LocaleKeys.login_noAccount.locale,
          secondSpan: LocaleKeys.login_signup.locale,
          onTap: onClickedSignUp,
        ),
        const Spacer(),
      ],
    );
  }

  Widget forgotText(BuildContext context, LoginViewModel viewModel) {
    return GestureText(
      title: LocaleKeys.login_forgot.locale,
      onTap: () => viewModel.navigateToPassword(),
    );
  }

  Padding loginButton(BuildContext context, LoginViewModel viewModel) {
    return Padding(
      padding: context.paddingNormal,
      child: CustomButton(
        color: context.colors.onSecondary,
        onPressed: () {
          viewModel.signIn();
        },
        title: LocaleKeys.login_login.locale,
      ),
    );
  }

  Widget buildPasswordTextField(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return ObscureTextField(
        lockControl: viewModel.isLockOpen,
        controller: viewModel.passwordController,
        icon: Icons.lock_outline_rounded,
        label: LocaleKeys.login_password.locale,
        onTap: () {
          viewModel.isLockChange();
        },
        validator: (password) => password != null && password.length < 6 ? LocaleKeys.valid_password.locale : null,
      );
    });
  }

  Widget buildMailTextField(BuildContext context, LoginViewModel viewModel) {
    return CustomTextField(
      label: LocaleKeys.login_mail.locale,
      controller: viewModel.emailController,
      validator: (email) => email != null && email.contains("@") ? null : LocaleKeys.valid_mail.locale,
      icon: Icons.mail_outline,
    );
  }

  SvgPicture buildSVG() => SvgPicture.asset(SVGConstants.instance.welcome);
}
