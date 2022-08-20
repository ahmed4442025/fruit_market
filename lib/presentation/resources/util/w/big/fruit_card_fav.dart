import 'package:flutter/material.dart';
import 'package:fruit_market/data/models/fruit_model.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';

class FruitCardFav extends StatelessWidget {
  final FruitModel fruitModel;
  int fruitCount = 0;

  FruitCardFav({Key? key, required this.fruitModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          // image
          image(),
          UtilM.box10(),
          info(context),
          Spacer(),
          addToCard()
        ],
      ),
    );
  }

  Widget image() => ClipRRect(
        borderRadius: BorderRadius.circular(AppPadding.p5),
        child: Image.asset(
          fruitModel.img ?? '',
          height: AppSize.s100,
          width: AppSize.s100,
          fit: BoxFit.cover,
        ),
      );

  Widget info(context) => SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(fruitModel.name ?? ''),
            Text(
              'Pick up from organic farms',
              style: AllStyles.text(context).bodySmall,
            ),
            UtilM.rateFruit(rate: fruitModel.rate ?? 0),
            UtilM.counter(onChange: (i) {
              fruitCount = i;
            }),
          ],
        ),
      );

  Widget addToCard() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${fruitModel.price} per/kg'),
          UtilM.buttonText(
              text: "add",
              onTap: () {
                print('buy $fruitCount ${fruitModel.name}');
              },
              width: 80,
              height: 40,
              clr: ColorManager.orange)
        ],
      );
}
