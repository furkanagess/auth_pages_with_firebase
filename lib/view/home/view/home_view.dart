// ignore_for_file: sort_child_properties_last

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/core/init/lang/language_manager.dart';
import 'package:flutter_auth/core/widgets/button/custom_button.dart';
import 'package:flutter_auth/core/widgets/button/custom_icon_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:flutter_auth/core/base/view/base_view.dart';
import 'package:flutter_auth/core/constants/enums/app_theme_enums.dart';
import 'package:flutter_auth/core/constants/svg/svg_constants.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';
import 'package:flutter_auth/core/extension/string_extension.dart';
import 'package:flutter_auth/core/init/lang/locale_keys.g.dart';
import 'package:flutter_auth/core/init/notifier/theme_notifier.dart';
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
                  style: context.textTheme.headlineSmall,
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
    child: CustomButton(
      color: context.colors.error,
      onPressed: () {
        viewModel.signOut();
      },
      title: LocaleKeys.signOut.locale,
    ),
  );
}

Padding changeThemeButton(BuildContext context, HomeViewModel viewModel) {
  return Padding(
    padding: context.paddingNormal,
    child: CustomIconButton(
      color: context.colors.onSecondary,
      icon: context.watch<ThemeNotifier>().currenThemeEnum == AppThemes.LIGHT ? Icons.dark_mode : Icons.sunny,
      onPressed: () {
        context.read<ThemeNotifier>().changeTheme();
      },
      title: LocaleKeys.changeTheme.locale,
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
              child: const Text("Türkçe"),
              value: LanguageManager.instance.trLocale,
            ),
            DropdownMenuItem(
              child: const Text("English"),
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
