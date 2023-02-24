import 'package:flutter/material.dart';
import 'package:flutter_auth/core/init/cache/locale_manager.dart';
import 'package:flutter_auth/core/init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  late BuildContext viewModelContext;

  void setContext(BuildContext context);
  void init();

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;
}
