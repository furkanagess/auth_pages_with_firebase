import 'package:flutter/material.dart';
import 'package:flutter_auth/core/base/view/base_view.dart';
import 'package:flutter_auth/view/home/viewModel/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("HOME"),
            ),
            Center(
              child: Text(
                viewModel.user.email!,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.signOut();
              },
              child: Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
