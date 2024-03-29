import 'package:flutter/material.dart';

import '../../../view/auth/auth/stream_builder.dart';
import '../../../view/auth/password/view/password_view.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../../extension/context_extension.dart';

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
        return normalNavigate(const PasswordView(), NavigationConstants.PASSWORD_VIEW);
      case NavigationConstants.AUTH_STREAM:
        return normalNavigate(const AuthStream(), NavigationConstants.AUTH_STREAM);
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Column(
              children: [
                Center(
                  child: Text(
                    "PAGE NOT FOUND",
                    style: context.textTheme.displayLarge?.copyWith(
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
