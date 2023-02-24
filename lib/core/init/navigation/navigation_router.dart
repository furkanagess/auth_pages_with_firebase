import 'package:flutter/material.dart';
import 'package:flutter_auth/core/constants/navigation/navigation_constants.dart';
import 'package:flutter_auth/view/auth/auth/stream_builder.dart';
import 'package:flutter_auth/view/auth/login/view/login_view.dart';
import 'package:flutter_auth/view/auth/password/view/password_view.dart';
import 'package:flutter_auth/view/auth/signup/view/signup_view.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      // case NavigationConstants.LOGIN_VIEW:
      //   return normalNavigate(LoginView(onClickedSignUp: too), NavigationConstants.LOGIN_VIEW);
      // case NavigationConstants.SIGNUP_VIEW:
      //   return normalNavigate(SignupView(), NavigationConstants.SIGNUP_VIEW);
      case NavigationConstants.PASSWORD_VIEW:
        return normalNavigate(PasswordView(), NavigationConstants.PASSWORD_VIEW);
      case NavigationConstants.AUTH_STREAM:
        return normalNavigate(AuthStream(), NavigationConstants.AUTH_STREAM);
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Column(
              children: [
                Center(
                  child: Text(
                    "PAGE NOT FOUND",
                    style: context.textTheme.headline1?.copyWith(
                      color: context.colors.error,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
