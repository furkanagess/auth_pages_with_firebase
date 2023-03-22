// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_auth/core/widgets/button/custom_button.dart';
import 'package:flutter_auth/core/widgets/text/custom_rich_text.dart';
import 'package:flutter_auth/core/widgets/textField/simple_textfield.dart';
import 'package:flutter_auth/core/widgets/textField/obscure_textfield.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_auth/core/base/view/base_view.dart';
import 'package:flutter_auth/core/constants/svg/svg_constants.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';
import 'package:flutter_auth/core/extension/string_extension.dart';
import 'package:flutter_auth/core/init/lang/locale_keys.g.dart';
import 'package:flutter_auth/view/auth/signup/viewModel/signup_view_model.dart';

class SignupView extends StatelessWidget {
  final VoidCallback onClickedSignIn;
  const SignupView({super.key, required this.onClickedSignIn});

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      viewModel: SignUpViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, SignUpViewModel viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: context.paddingNormal,
          child: Form(
            key: viewModel.formKey,
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
                  child: buildNameTextField(context),
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
                  child: signupButton(context, viewModel),
                ),
                Expanded(
                  flex: 1,
                  child: loginRow(context, viewModel),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row loginRow(BuildContext context, SignUpViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(),
        CustomRichText(
          firstSpan: LocaleKeys.signup_account.locale,
          secondSpan: LocaleKeys.login_login.locale,
          onTap: onClickedSignIn,
        ),
        const Spacer(),
      ],
    );
  }

  Padding signupButton(BuildContext context, SignUpViewModel viewModel) {
    return Padding(
      padding: context.paddingNormal,
      child: CustomButton(
        color: context.colors.onSecondary,
        onPressed: () {
          viewModel.signUp();
        },
        title: LocaleKeys.login_signup.locale,
      ),
    );
  }

  Widget buildPasswordTextField(BuildContext context, SignUpViewModel viewModel) {
    return Observer(
      builder: (_) {
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
      },
    );
  }

  Widget buildNameTextField(BuildContext context) {
    return CustomTextField(
      label: LocaleKeys.signup_name.locale,
      icon: Icons.person_outline_outlined,
    );
  }

  Widget buildMailTextField(BuildContext context, SignUpViewModel viewModel) {
    return CustomTextField(
      controller: viewModel.emailController,
      icon: Icons.mail_outline,
      label: LocaleKeys.login_mail.locale,
      validator: (email) => email != null && email.contains("@") ? null : LocaleKeys.valid_mail.locale,
    );
  }

  SvgPicture buildSVG() => SvgPicture.asset(SVGConstants.instance.mobileLogin);
}
