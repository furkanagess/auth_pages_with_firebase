// ignore_for_file: sort_child_properties_last

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/core/init/lang/language_manager.dart';
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
              child: changeThemeButton(context, viewModel),
            ),
            Expanded(
              flex: 2,
              child: changeLanguageDropdown(context, viewModel),
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

Padding changeThemeButton(BuildContext context, HomeViewModel viewModel) {
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

Padding changeLanguageDropdown(BuildContext context, HomeViewModel viewModel) {
  return Padding(
    padding: context.paddingNormal,
    child: Card(
      color: context.colors.onSecondary,
      child: ListTile(
        title: Text(LocaleKeys.changeLanguage.locale),
        textColor: context.colors.background,
        trailing: DropdownButton<Locale>(
          items: [
            DropdownMenuItem(
              child: Text("Türkçe"),
              value: LanguageManager.instance.trLocale,
            ),
            DropdownMenuItem(
              child: Text("English"),
              value: LanguageManager.instance.enLocale,
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              context.setLocale(value);
            }
          },
        ),
      ),
    ),
  );
}

SvgPicture buildSVG() => SvgPicture.asset(SVGConstants.instance.welcomeCat);
