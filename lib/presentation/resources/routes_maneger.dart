import 'package:fruit_market/presentation/details_fruit/details_fruit_view.dart';
import 'package:fruit_market/presentation/notify_view/notify_view.dart';
import 'package:fruit_market/presentation/settings/Notification.dart';
import 'package:fruit_market/presentation/settings/account_settings.dart';
import 'package:fruit_market/presentation/settings/change_address.dart';
import 'package:fruit_market/presentation/settings/language.dart';
import 'package:fruit_market/presentation/settings/public_settings.dart';
import '../login/login_view.dart';
import '../main/main_view.dart';
import '../onboarding/onboarding.dart';
import '../register/register_view.dart';
import '../resources/strings_manager.dart';
import '../splash/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRout = "/";
  static const String loginRout = "/login";
  static const String registerRout = "/register";
  static const String mainRout = "/main";
  static const String onBoardingRout = "/onBoarding";
  static const String detailsRout = "/details";
  static const String notifyViewRout = "/notifyView";

  // settings
  static const String settingAcc = "/settingAcc";
  static const String settingLang = "/settingLang";
  static const String settingPublic = "/settingPublic";
  static const String settingAddress = "/settingAddress";
  static const String settingNotify = "/settingNotify";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRout:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRout:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRout:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.mainRout:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.onBoardingRout:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.detailsRout:
        return MaterialPageRoute(builder: (_) => DetailsFruitView());
      // settings
      case Routes.settingAcc:
        return MaterialPageRoute(builder: (_) => SettingsAccView());
      case Routes.settingAddress:
        return MaterialPageRoute(builder: (_) => SettingsAddressView());
      case Routes.settingLang:
        return MaterialPageRoute(builder: (_) => SettingsLangView());
      case Routes.settingNotify:
        return MaterialPageRoute(builder: (_) => SettingNotificationView());
      case Routes.settingPublic:
        return MaterialPageRoute(builder: (_) => SettingPublicView());
        case Routes.notifyViewRout:
        return MaterialPageRoute(builder: (_) => NotifyView());

      // 404 not fount
      default:
        return _unDefinedRout();
    }
  }

  static Route<dynamic> _unDefinedRout() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(StringsManager.noRouteFound),
              ),
              body: const Center(
                child: Text(StringsManager.noRouteFound),
              ),
            ));
  }
}
