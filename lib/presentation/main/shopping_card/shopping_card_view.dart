import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/font_manager.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';
import '../../../app/functions/cubits/app/app_cubit.dart';
import '../../../app/functions/cubits/app/app_states.dart';
import '../../resources/util/util_manager.dart';

class ShoppingCardView extends StatelessWidget {
  ShoppingCardView({Key? key}) : super(key: key);
  late BuildContext _context;
  late AppCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        _context = context;
        _cubit = AppCubit.get(context);
        return myScaffold();
      },
    );
  }

  Scaffold myScaffold() => Scaffold(
        appBar: UtilM.appBar(showNotification: false, name: 'ShoppingCard'),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: Column(
            children: [
              address(),
              Expanded(child: listFruits()),
              UtilM.box10(),
              placeOrder()
            ],
          ),
        ),
      );

  Widget listFruits() => ListView.separated(
        itemCount: _cubit.groupOfFruits[1].list.length,
        itemBuilder: (c, i) =>
            UtilM.fruitCardCar(_cubit.groupOfFruits[1].list[i]),
        separatorBuilder: (cs, i) => const Divider(height: AppSize.s30),
      );

  Widget address() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.location_on_outlined,
          ),
          Text(
            '${_cubit.setAddress.substring(0, 25)} ...',
            style: AllStyles.text(_context)
                .bodySmall!
                .copyWith(fontSize: FontSizeManager.s16),
          ),
          TextButton(
              onPressed: () => ViewsManager.openWBSettAddress(_context),
              child: Text(
                'Change Address',
                style: AllStyles.text(_context)
                    .bodySmall!
                    .copyWith(color: Colors.blue),
              ))
        ],
      );

  Widget placeOrder() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total- Rs 570'),
          UtilM.buttonText(text: 'Place Order', onTap: () {})
        ],
      );
}
