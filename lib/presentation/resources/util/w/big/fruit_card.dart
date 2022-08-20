import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';

import '../../../../../app/functions/cubits/app/app_cubit.dart';
import '../../../../../app/functions/cubits/app/app_states.dart';
import '../../../../../data/models/fruit_model.dart';
import '../../../all_styles.dart';
import '../../../color_manager.dart';
import '../../../values_manager.dart';
import '../../util_manager.dart';

class FruitCard extends StatelessWidget {
  final FruitModel fruitModel;
  final double imgHeight = AppSize.fruitCImgHeight;
  final double height = AppSize.fruitCHeight;
  final double width = AppSize.fruitCWidth;

  final bool shadow = false;
  late AppCubit _cubit;

  FruitCard({Key? key, required this.fruitModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        _cubit = AppCubit.get(context);
        return InkWell(
          onTap: () {
            _cubit.currentFruitCard = fruitModel;
            ViewsManager.openDetailsWithBack(context);
          },
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  child: Stack(
                    children: [
                      Image.asset(
                        fruitModel.img ?? '',
                        height: imgHeight,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                      // shadow
                      if (shadow)
                        Container(
                            width: width,
                            height: imgHeight,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                              colors: ColorManager.shadowList,
                            ))),
                      // love
                      Positioned(
                        top: 5,
                        right: 5,
                        child: InkWell(
                          onTap: () => _cubit.addFav(fruitModel),
                          child: CircleAvatar(
                            backgroundColor: ColorManager.white,
                            radius: AppSize.s16,
                            child: Icon(
                              fruitModel.isFavorite ?? false
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: AppSize.s20,
                              color: fruitModel.isFavorite ?? false
                                  ? ColorManager.error
                                  : ColorManager.orange,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // rate
                UtilM.box5(),
                UtilM.rateFruit(rate: fruitModel.rate ?? 0),
                // title
                UtilM.box5(),
                Text(
                  fruitModel.name ?? '',
                  style: AllStyles.text(context).bodyMedium,
                ),
                UtilM.box5(),
                Text(
                  "\$ ${fruitModel.price.toString()} per/ kg",
                  style: AllStyles.text(context).bodySmall,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
