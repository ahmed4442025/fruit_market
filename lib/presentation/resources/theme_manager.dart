import 'font_manager.dart';
import '../resources/styles_manager.dart';

import 'values_manager.dart';
import 'package:flutter/material.dart';
import 'color_manager.dart';

class ThemeManager {
  static ThemeData getAppTheme() {
    return ThemeData(
        // ------------ main colors ------------
        primaryColor: ColorManager.primary,
        primaryColorLight: ColorManager.lightPrimary,
        primaryColorDark: ColorManager.darkPrimary,
        disabledColor: ColorManager.grey1,
        splashColor: ColorManager.lightPrimary,
        primarySwatch: ColorManager.primarySwatch,
        // ------------ card view theme ------------
        cardTheme: const CardTheme(
            color: ColorManager.white,
            shadowColor: ColorManager.grey2,
            elevation: AppSize.s4),

        // ------------ app bar theme ------------
        appBarTheme: AppBarTheme(
            // centerTitle: true,
            color: ColorManager.primary,
            elevation: AppSize.s0,
            // shadowColor: ColorManager.lightPrimary,
            titleTextStyle: StylesManager.getRegularStyle(
                fontSize: FontSizeManager.s18, color: ColorManager.white),
        ),

        // ------------ button theme ------------
        buttonTheme: const ButtonThemeData(
            shape: StadiumBorder(),
            disabledColor: ColorManager.grey1,
            buttonColor: ColorManager.primary,
            splashColor: ColorManager.lightPrimary),

        // ------------ elevated button them ------------
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                textStyle: StylesManager.getRegularStyle(
                    color: ColorManager.white, fontSize: FontSizeManager.s17),
                backgroundColor: ColorManager.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12)))),

        // ------------ text theme ------------
        textTheme: TextTheme(
          // splash scr
          headlineLarge: StylesManager.getSemiBoldStyle(
              color: ColorManager.white, fontSize: FontSizeManager.s50),

          displayLarge: StylesManager.getSemiBoldStyle(
              color: ColorManager.lightBlack, fontSize: FontSizeManager.s28),

          titleMedium: StylesManager.getMediumStyle(
              color: ColorManager.lightGrey, fontSize: FontSizeManager.s16),
          headlineMedium: StylesManager.getMediumStyle(
              color: ColorManager.lightLightBlack, fontSize: FontSizeManager.s16),
          // body
          bodyLarge: StylesManager.getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSizeManager.s18),
          bodyMedium: StylesManager.getMediumStyle(
              color: ColorManager.lightBlack, fontSize: FontSizeManager.s16),
          bodySmall: StylesManager.getRegularStyle(
              color: ColorManager.lightBlack, fontSize: FontSizeManager.s14),
          labelSmall: StylesManager.getRegularStyle(
              color: ColorManager.grey1, fontSize: FontSizeManager.s12),
        ),
        // ------------ input decoration theme (text form field) ------------
        inputDecorationTheme: InputDecorationTheme(
            // content padding
            contentPadding: const EdgeInsets.all(AppPadding.p8),
            // hint style
            hintStyle: StylesManager.getRegularStyle(
                color: ColorManager.grey1, fontSize: FontSizeManager.s14),
            labelStyle: StylesManager.getMediumStyle(
                color: ColorManager.grey1, fontSize: FontSizeManager.s14),
            errorStyle:
                StylesManager.getRegularStyle(color: ColorManager.error),

            // enabled border style
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorManager.primary, width: AppSize.s1_5),
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

            // focused border style
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorManager.grey1, width: AppSize.s1_5),
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

            // error border style
            errorBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorManager.error, width: AppSize.s1_5),
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
            // focused border style
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorManager.primary, width: AppSize.s1_5),
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))),

        // ------------ bottomNavigationBarTheme ------------
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: ColorManager.primary,
            unselectedItemColor: ColorManager.lightGrey,
            selectedLabelStyle: StylesManager.getMediumStyle(
                color: ColorManager.primary, fontSize: FontSizeManager.s12),
            unselectedLabelStyle: StylesManager.getMediumStyle(
                color: ColorManager.lightGrey, fontSize: FontSizeManager.s14),
            selectedIconTheme: const IconThemeData(size: AppSize.s30),
            unselectedIconTheme: const IconThemeData(size: AppSize.s30)));
  }
}
