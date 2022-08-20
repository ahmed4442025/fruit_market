import 'package:flutter/material.dart';
import 'package:fruit_market/app/functions/shared/cache_manager.dart';

import 'routes_maneger.dart';

class ViewsManager {
  // logic
  static homeAfterSplash(context) {
    // if skip on boarding
    CacheGet.skipIntro ? tempHome(context) : openOnBoardingView(context);
  }

  static void tempHome(context) {
    openHomeView(context);
  }

  // const
  static void openLoginView(context) {
    _openViewNoBack(context, Routes.loginRout);
  }

  static void openRegisterView(context) {
    _openViewNoBack(context, Routes.registerRout);
  }

  static void openHomeView(context) {
    _openViewNoBack(context, Routes.mainRout);
  }

  static void openOnBoardingView(context) {
    _openViewNoBack(context, Routes.onBoardingRout);
  }

  static void openDetailsWithBack(context) {
    _openViewWithBack(context, Routes.detailsRout);
  }

  // go back
  static void backIfUCan(context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  // settings
  static void openWBSettAcc(context) {
    _openViewWithBack(context, Routes.settingAcc);
  }

  static void openWBSettPub(context) {
    _openViewWithBack(context, Routes.settingPublic);
  }

  static void openWBSetLan(context) {
    _openViewWithBack(context, Routes.settingLang);
  }

  static void openWBSettAddress(context) {
    _openViewWithBack(context, Routes.settingAddress);
  }

  static void openWBSettNotify(context) {
    _openViewWithBack(context, Routes.settingNotify);
  }

  // ==========
  static void _openViewNoBack(context, nextPage) {
    Navigator.pushReplacementNamed(context, nextPage);
  }

  static void _openViewWithBack(context, nextPage) {
    Navigator.of(context).pushNamed(nextPage);
  }
}
