import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/data/models/fruit_model.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';
import 'package:fruit_market/presentation/resources/font_manager.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';
import '../../app/functions/cubits/app/app_cubit.dart';
import '../../app/functions/cubits/app/app_states.dart';

class DetailsFruitView extends StatelessWidget {
  DetailsFruitView({Key? key}) : super(key: key);
  late BuildContext _context;
  late AppCubit _cubit;
  late FruitModel myFruit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        _context = context;
        _cubit = AppCubit.get(context);
        myFruit = _cubit.currentFruitCard ?? FruitModel();
        return myScaffold();
      },
    );
  }

  Scaffold myScaffold() => Scaffold(
        appBar: UtilM.appBar(
            onBack: () => ViewsManager.backIfUCan(_context),
            showNotification: false,
            name: "DETAILS"),
        body: _cubit.currentFruitCard != null
            ? Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: ListView(
                  children: [
                    imageF(),
                    UtilM.box15(),
                    name(),
                    UtilM.box15(),
                    details(),
                    UtilM.box30(),
                    nutrition(),
                    UtilM.box15(),
                    nutritionList(),
                    UtilM.box30(),
                    buyNow()
                  ],
                ),
              )
            : const Center(
                child: Text('no Fruit selected'),
              ),
      );

  // image
  Widget imageF() => ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s10),
        child: Image.asset(
          myFruit.img ?? '',
          height: 250,
          fit: BoxFit.cover,
        ),
      );

  // name
  Widget name() => Text(
        myFruit.name ?? '',
        style: AllStyles.text(_context).bodyLarge,
      );

  // details
  Widget details() => Padding(
        padding: const EdgeInsets.only(left: AppPadding.p16),
        child: Text(
          myFruit.details ?? '',
          style: AllStyles.text(_context).labelMedium,
        ),
      );

  // Nutrition
  Widget nutrition() => Text(
        "Nutrition",
        style: AllStyles.text(_context).bodyLarge,
      );

  // Nutrition
  Widget nutritionList() =>
      Column(children: [...?myFruit.nutrition?.map((e) => oneNutrit(e))]);

  Widget oneNutrit(String name) => Padding(
        padding: const EdgeInsets.all(AppPadding.p5),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 4,
              backgroundColor: ColorManager.grey2,
            ),
            UtilM.box10(),
            Text(
              name,
              style: AllStyles.text(_context).labelMedium!.copyWith(
                  color: ColorManager.lightBlack,
                  fontSize: FontSizeManager.s14),
            ),
          ],
        ),
      );

  // buy now
  Widget buyNow() => Row(
        children: [
          Text('\$ ${myFruit.price}  per/kg'),
          const Spacer(),
          UtilM.buttonText(text: 'Buy now', onTap: () => _cubit.buyNow(myFruit))
        ],
      );

  void test(){

  }
}
