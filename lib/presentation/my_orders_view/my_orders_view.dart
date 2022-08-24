import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/data/models/fruit_model.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';
import '../../app/functions/cubits/app/app_cubit.dart';
import '../../app/functions/cubits/app/app_states.dart';
import '../resources/util/util_manager.dart';
import '../resources/values_manager.dart';

class MyOrdersView extends StatelessWidget {
  MyOrdersView({Key? key}) : super(key: key);
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
        appBar: UtilM.appBar(
            showNotification: false,
            name: 'My Orders',
            onBack: () => ViewsManager.backIfUCan(_context)),
        body: ListView.separated(
          itemCount: _cubit.groupOfFruits[0].list.length,
          itemBuilder: (c, i) => Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: OrderCard(
              fruitModel: _cubit.groupOfFruits[0].list[i],
            ),
          ),
          separatorBuilder: (c, i) => const Divider(
            height: 2,
          ),
        ),
      );
}

class OrderCard extends StatelessWidget {
  final FruitModel fruitModel;
  late BuildContext _context;

  OrderCard({Key? key, required this.fruitModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        image(),
        UtilM.box10(),
        Expanded(child: info()),
        showMore(),
      ],
    );
  }

  Widget image() => ClipRRect(
        borderRadius: BorderRadius.circular(AppPadding.p12),
        child: Image.asset(
          fruitModel.img ?? '',
          height: AppSize.s100,
          width: AppSize.s100,
          fit: BoxFit.cover,
        ),
      );

  Widget info() => SizedBox(
        height: AppSize.s100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              (fruitModel.name ?? ''),
              style: AllStyles.text(_context).titleSmall,
            ),
            UtilM.rateFruit(rate: 0, active: true),
            Text('Rate this Product ',
                style: AllStyles.text(_context).labelSmall),
            Text('Delivered on 24 Feb 2021.',
                style: AllStyles.text(_context).bodySmall),
          ],
        ),
      );

  Widget showMore() =>
      const SizedBox(width: 30, child: Icon(Icons.arrow_forward_ios));
}
