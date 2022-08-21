import 'package:flutter/material.dart';
import 'package:fruit_market/data/models/fruit_model.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';

class FruitCardCar extends StatelessWidget {
  final FruitModel fruitModel;
  int fruitCount = 0;

  FruitCardCar({Key? key, required this.fruitModel}) : super(key: key);

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
          const Spacer(),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(fruitModel.name ?? ''),
                  Text('   rs 40 Saved',
                      style: AllStyles.text(context)
                          .bodySmall
                          ?.copyWith(color: ColorManager.lightGreen)),
                ],
              ),
            ),
            Text(
              'rs 190',
              style: AllStyles.text(context)
                  .bodySmall
                  ?.copyWith(decoration: TextDecoration.lineThrough),
            ),
            Text('${fruitModel.price} per/kg'),
          ],
        ),
      );

  Widget addToCard() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
              onTap: () {
                print('delete ${fruitModel.name}');
              },
              child: const Icon(Icons.delete_forever)),
          UtilM.counter(onChange: (i) {
            fruitCount = i;
          }),
        ],
      );
}
