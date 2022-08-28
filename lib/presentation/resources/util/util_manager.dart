import 'package:flutter/material.dart';
import 'package:fruit_market/data/models/fruit_model.dart';
import 'package:fruit_market/data/models/group_model.dart';
import 'package:fruit_market/presentation/resources/util/w/big/add_remove_one.dart';
import 'package:fruit_market/presentation/resources/util/w/big/code_6.dart';
import 'package:fruit_market/presentation/resources/util/w/big/fruit_card.dart';
import 'package:fruit_market/presentation/resources/util/w/big/fruit_card_car.dart';
import 'package:fruit_market/presentation/resources/util/w/big/fruit_card_fav.dart';
import 'package:fruit_market/presentation/resources/util/w/big/fruit_group.dart';
import 'package:fruit_market/presentation/resources/util/w/big/fruit_type_label.dart';
import 'package:fruit_market/presentation/resources/util/w/big/loading_animation_list.dart';
import 'package:fruit_market/presentation/resources/util/w/big/rateFruit.dart';
import 'package:fruit_market/presentation/resources/util/w/small/search_textField.dart';
import '../all_styles.dart';
import 'w/big/app_bar_custom.dart';
import 'w/big/keaboard_num.dart';
import 'w/big/nav_bar_custom.dart';
import 'w/small/elevatedCustomBt.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';

class UtilM {
  static SizedBox box5() =>
      const SizedBox(height: AppSize.s5, width: AppSize.s5);

  static SizedBox box10() =>
      const SizedBox(height: AppSize.s10, width: AppSize.s10);

  static SizedBox box15() =>
      const SizedBox(height: AppSize.s15, width: AppSize.s15);

  static SizedBox box20() =>
      const SizedBox(height: AppSize.s20, width: AppSize.s20);

  static SizedBox box30() =>
      const SizedBox(height: AppSize.s30, width: AppSize.s30);

  static SizedBox box40() =>
      const SizedBox(height: AppSize.s40, width: AppSize.s40);

  static SizedBox box60() =>
      const SizedBox(height: AppSize.s60, width: AppSize.s60);

  static SizedBox box100() =>
      const SizedBox(height: AppSize.s100, width: AppSize.s100);

  static buttonText(
          {String text = '',
          double width = 180,
          double height = 50,
          VoidCallback? onTap,
          Color? clr}) =>
      ElevatCustomBt(
        text: text,
        height: height,
        width: width,
        onTap: onTap,
        clr: clr,
      );

  static iconButton(context, VoidCallback onTap, IconData icon, String text) =>
      TextButton.icon(
          onPressed: onTap,
          icon: Icon(
            icon,
            size: AppSize.s30,
          ),
          label: Text(
            '  $text',
            style: AllStyles.text(context).headlineMedium,
          ));

  static searchTextField({appBarHeight2 = 70}) => SearchTextField(
        appBarHeight: appBarHeight2,
      );

  // ========= big ==========
  static Widget navBar() => NavBarCustom();

  static AppBar appBar({
    showNotification = false,
    notificationCount = 0,
    String name = '',
    VoidCallback? onBack,
    VoidCallback? onNotify,
  }) =>
      AppBarCustom(
              showNotification: showNotification,
              notificationCount: notificationCount,
              name: name,
              onBack: onBack,
              onNotify: onNotify)
          .appBar();

  static Widget fruitTypesLabels() => FruitListTypes();

  static Widget fruitCard(FruitModel fruit) => FruitCard(fruitModel: fruit);

  static Widget fruitGroup(GroupModel group) => FruitGroup(oneGroup: group);

  static Widget rateFruit({double rate = 5, active = false}) => RateFruit(
        rate: rate,
        active: active,
      );

  static Widget fruitCardFav(FruitModel fruit) =>
      FruitCardFav(fruitModel: fruit);

  static Widget fruitCardCar(FruitModel fruit) =>
      FruitCardCar(fruitModel: fruit);

  static Widget counter({void Function(int)? onChange}) => AddOne(
        onChange: onChange ?? (i) {},
      );

  static Widget keyboardNum(
          {void Function(String)? onChange,
          VoidCallback? onSubmit,
          int? max}) =>
      KeyboardNum(
        onChange: onChange ?? (v) {},
        onSubmit: onSubmit ?? () {},
        max: max,
      );

  static Widget randomLoading({int? index, double? size, Color? clr}) =>
      LoadingAnimationList.randomLoading(index: index, clr: clr, size: size);

  static Widget code6({String text = 'XXXXXX'}) => Code6(
        text: text,
      );
}
