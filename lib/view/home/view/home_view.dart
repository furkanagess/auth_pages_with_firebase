// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/enums/app_theme_enums.dart';
import '../../../core/constants/svg/svg_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../viewModel/home_view_model.dart';

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
            const Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 5,
              child: buildSVG(),
            ),
            Expanded(
              child: Center(
                child: Text(
                  viewModel.user.email!,
                  style: context.textTheme.headline5,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: chaneThemeButton(context, viewModel),
            ),
            Expanded(
              flex: 2,
              child: signOutButton(context, viewModel),
            ),
            Expanded(
              flex: 2,
              child: signOutButton(context, viewModel),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}

Padding signOutButton(BuildContext context, HomeViewModel viewModel) {
  return Padding(
    padding: context.paddingNormal,
    child: ElevatedButton(
      onPressed: () {
        viewModel.signOut();
      },
      child: Center(
        child: Text(
          LocaleKeys.signOut.locale,
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

Padding chaneThemeButton(BuildContext context, HomeViewModel viewModel) {
  return Padding(
    padding: context.paddingNormal,
    child: ElevatedButton.icon(
      icon: Icon(
        context.watch<ThemeNotifier>().currenThemeEnum == AppThemes.LIGHT ? Icons.dark_mode : Icons.sunny,
        color: context.colors.background,
      ),
      onPressed: () {
        context.read<ThemeNotifier>().changeTheme();
      },
      label: Center(
        child: Text(
          LocaleKeys.changeTheme.locale,
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

SvgPicture buildSVG() => SvgPicture.asset(SVGConstants.instance.welcomeCat);
