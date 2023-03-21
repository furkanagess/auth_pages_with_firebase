// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_auth/core/widgets/button/custom_button.dart';
import 'package:flutter_auth/core/widgets/textField/simple_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_auth/core/base/view/base_view.dart';
import 'package:flutter_auth/core/constants/svg/svg_constants.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';
import 'package:flutter_auth/core/extension/string_extension.dart';
import 'package:flutter_auth/core/init/lang/locale_keys.g.dart';
import 'package:flutter_auth/view/auth/password/viewModel/password_view_model.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PasswordViewModel>(
      viewModel: PasswordViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, PasswordViewModel viewModel) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: context.colors.onSurface,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              viewModel.navigateToLogin();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              size: context.iconTheme.size,
              color: context.iconTheme.color,
            ),
          ),
        ),
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
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 2,
                child: buildMailTextField(context, viewModel),
              ),
              Expanded(
                flex: 2,
                child: resetButton(context, viewModel),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding resetButton(BuildContext context, PasswordViewModel viewModel) {
    return Padding(
      padding: context.paddingNormal,
      child: CustomButton(
        onPressed: () {
          viewModel.resetPassword();
        },
        title: LocaleKeys.reset.locale,
      ),
    );
  }

  Widget buildMailTextField(BuildContext context, PasswordViewModel viewModel) {
    return SimpleTextField(
      controller: viewModel.emailController,
      icon: Icons.mail_outline,
      label: LocaleKeys.login_mail.locale,
      validator: (email) => email != null && email.contains("@") ? null : LocaleKeys.valid_mail.locale,
    );
  }

  SvgPicture buildSVG() => SvgPicture.asset(SVGConstants.instance.forgotPassword);
}
