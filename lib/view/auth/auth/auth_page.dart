import 'package:flutter/material.dart';

import 'package:flutter_auth/view/auth/login/view/login_view.dart';
import 'package:flutter_auth/view/auth/signup/view/signup_view.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginView(
          onClickedSignUp: toggle,
        )
      : SignupView(
          onClickedSignIn: toggle,
        );

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
