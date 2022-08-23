import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';

import '../../../../../app/functions/cubits/app/app_cubit.dart';
import '../../../../../app/functions/cubits/app/app_states.dart';
import '../../../../../data/models/fruit_type.dart';

class FruitListTypes extends StatelessWidget {
  FruitListTypes({Key? key}) : super(key: key);
  late AppCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        _cubit = AppCubit.get(context);
        return SizedBox(
          height: AppSize.s55,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _cubit.fruitTypes.length,
            itemBuilder: (BuildContext context, int index) {
              return _FruitTypeLabel(
                  fruitType: _cubit.fruitTypes[index],
                  onTap: () => _cubit.changeCoffeeLabelIndex(index));
            },
          ),
        );
      },
    );
  }
}

class _FruitTypeLabel extends StatelessWidget {
  final FruitType fruitType;
  final VoidCallback onTap;

  const _FruitTypeLabel(
      {Key? key, required this.fruitType, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s14),
      child: Column(
        children: [
          InkWell(
            splashColor: ColorManager.lightOrange,
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              decoration: BoxDecoration(
                  color: fruitType.isSelected ? ColorManager.orange : null,
                  borderRadius: BorderRadius.circular(AppPadding.p8)),
              child: Text(
                fruitType.name,
                style: fruitType.isSelected
                    ? AllStyles.text(context)
                        .titleMedium!
                        .copyWith(color: ColorManager.white)
                    : AllStyles.text(context).titleMedium,
              ),
            ),
          ),
          if (fruitType.isSelected)
            const Padding(
              padding: EdgeInsets.only(top: AppPadding.p5),
              child: CircleAvatar(
                backgroundColor: ColorManager.orange,
                radius: 5,
              ),
            )
        ],
      ),
    );
  }
}
