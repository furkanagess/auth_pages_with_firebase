// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/svg/svg_constants.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewModel/password_view_model.dart';

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
        backgroundColor: context.colors.background,
        appBar: AppBar(
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
      child: ElevatedButton(
        onPressed: () {
          viewModel.resetPassword();
        },
        child: Center(
          child: Text(
            LocaleKeys.reset.locale,
            style: context.textTheme.headline6?.copyWith(
              color: context.colors.background,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: context.paddingLow,
          shape: const StadiumBorder(),
          backgroundColor: context.colors.onSecondary,
        ),
      ),
    );
  }

  TextFormField buildMailTextField(BuildContext context, PasswordViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) => email != null && email.contains("@") ? null : LocaleKeys.valid_mail.locale,
      cursorColor: context.colors.onSecondary,
      decoration: InputDecoration(
        focusColor: context.colors.onSecondary,
        labelText: LocaleKeys.login_mail.locale,
        icon: Icon(
          Icons.mail_outline,
          size: 30,
          color: context.colors.onSecondary,
        ),
      ),
    );
  }

  SvgPicture buildSVG() => SvgPicture.asset(SVGConstants.instance.forgotPassword);
}
