import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_auth/core/base/view/base_view.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';
import 'package:flutter_auth/core/extension/string_extension.dart';
import 'package:flutter_auth/view/auth/signup/viewModel/signup_view_model.dart';

import '../../../../core/constants/svg/svg_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';

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
        backgroundColor: context.colors.background,
        body: Padding(
          padding: context.paddingNormal,
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                Spacer(
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
                // Add dynamic eye icon for obscure password using Mobx
                Expanded(
                  flex: 2,
                  child: buildPasswordTextField(context, viewModel),
                ),
                // When click to signupButton it will show up a alertDialog about Succesfully Register with Lottie.
                Expanded(
                  flex: 2,
                  child: signupButton(context, viewModel),
                ),
                Expanded(
                  flex: 1,
                  child: loginRow(context, viewModel),
                ),
                Spacer(),
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
        Spacer(),
        RichText(
          text: TextSpan(
            text: "No account ?",
            style: context.textTheme.bodyText2,
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap = onClickedSignIn,
                text: "Sign up",
                style: context.textTheme.bodyText2,
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }

  Padding signupButton(BuildContext context, SignUpViewModel viewModel) {
    return Padding(
      padding: context.paddingNormal,
      child: ElevatedButton(
        onPressed: () {
          // viewModel.showSuccessAlert(
          //   context,
          //   text: LocaleKeys.alert_succes_register_text.locale,
          //   title: LocaleKeys.alert_succes_register_title.locale,
          // );
          viewModel.signUp();
        },
        child: Center(
          child: Text(
            LocaleKeys.login_signup.locale,
            style: context.textTheme.headline6?.copyWith(
              color: context.colors.background,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: context.paddingLow,
          shape: StadiumBorder(),
          backgroundColor: context.colors.onSecondary,
        ),
      ),
    );
  }

  Widget buildPasswordTextField(BuildContext context, SignUpViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (password) => password != null && password.length < 6 ? "Enter valid passowrd" : null,
        controller: viewModel.passwordController,
        cursorColor: context.colors.onSecondary,
        obscureText: viewModel.isLockOpen,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () {
              viewModel.isLockChange();
            },
            child: Observer(
              builder: (_) {
                return Icon(
                  viewModel.isLockOpen ? Icons.visibility_off : Icons.visibility,
                  color: context.iconTheme.color,
                );
              },
            ),
          ),
          labelText: LocaleKeys.login_password.locale,
          icon: Icon(
            Icons.lock_outline_rounded,
            size: 30,
            color: context.colors.onSecondary,
          ),
        ),
      );
    });
  }

  TextFormField buildNameTextField(BuildContext context) {
    return TextFormField(
      cursorColor: context.colors.onSecondary,
      decoration: InputDecoration(
        focusColor: context.colors.onSecondary,
        labelText: LocaleKeys.signup_name.locale,
        icon: Icon(
          Icons.person_outline_outlined,
          size: 30,
          color: context.colors.onSecondary,
        ),
      ),
    );
  }

  TextFormField buildMailTextField(BuildContext context, SignUpViewModel viewModel) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) => email != null && email.contains("@") ? null : "enter valid",
      controller: viewModel.emailController,
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

  SvgPicture buildSVG() => SvgPicture.asset(SVGConstants.instance.mobileLogin);
}
