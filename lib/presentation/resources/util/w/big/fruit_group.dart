import 'package:flutter/material.dart';
import 'package:fruit_market/data/models/group_model.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';

import '../../../values_manager.dart';
import '../../util_manager.dart';

class FruitGroup extends StatelessWidget {
  final GroupModel oneGroup;

  const FruitGroup({Key? key, required this.oneGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Row(
            children: [
              Text(
                oneGroup.name ?? '',
                style: AllStyles.text(context).bodyLarge,
              ),
              UtilM.box15(),
              Text(
                oneGroup.sub ?? '',
                style: AllStyles.text(context)
                    .bodyMedium
                    ?.copyWith(color: ColorManager.lightGreen),
              )
            ],
          ),
          // sub title
          UtilM.box10(),
          Text(
            oneGroup.title ?? '',
            style: AllStyles.text(context).bodySmall,
          ),
          // cards
          SizedBox(
            height: AppSize.groupFHeight,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: oneGroup.list.length,
                itemBuilder: (c, i) => Padding(
                      padding: const EdgeInsets.only(
                          top: AppPadding.p10, right: AppPadding.p16),
                      child: UtilM.fruitCard(oneGroup.list[i]),
                    )),
          ),
        ],
      ),
    );
  }
}
