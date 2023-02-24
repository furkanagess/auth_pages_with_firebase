import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/view/auth/auth/auth_page.dart';
import 'package:flutter_auth/view/auth/login/view/login_view.dart';
import 'package:flutter_auth/view/home/view/home_view.dart';

class AuthStream extends StatelessWidget {
  const AuthStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeView();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
