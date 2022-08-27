import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/data/models/notify_model.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';
import '../../app/functions/cubits/app/app_cubit.dart';
import '../../app/functions/cubits/app/app_states.dart';
import '../../data/models/notify_group.dart';
import '../resources/util/util_manager.dart';
import '../resources/values_manager.dart';

class NotifyView extends StatelessWidget {
  NotifyView({Key? key}) : super(key: key);
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
        appBar: UtilM.appBar( name: 'Notification'),
        body: Padding(
            padding: const EdgeInsets.all(AppPadding.p5),
            child: ListView.builder(
              itemCount: _cubit.notify.length,
              itemBuilder: (c, i) => NotifyGroupCard(
                notifyGroup: _cubit.notify[i],
              ),
            )),
      );
}

class NotifyGroupCard extends StatelessWidget {
  final NotifyGroup notifyGroup;

  const NotifyGroupCard({Key? key, required this.notifyGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // data ( today, yesterday ...)
        Container(
          width: double.infinity,
          height: 35,
          color: ColorManager.lightLightGreen,
          child: Center(
            child: Text(notifyGroup.name ?? '',
                style: AllStyles.text(context).bodyLarge),
          ),
        ),
        UtilM.box10(),
        // cards of notify + divider
        for (int i = 0; i < notifyGroup.notifyList!.length; i++) ...[
          NotifyCard(notifyModel: notifyGroup.notifyList![i]),
          i != notifyGroup.notifyList!.length - 1
              ? const Divider()
              : UtilM.box15()
        ]
      ],
    );
  }
}

class NotifyCard extends StatelessWidget {
  final NotifyModel notifyModel;
  late BuildContext _context;

  NotifyCard({Key? key, required this.notifyModel}) : super(key: key);

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
          notifyModel.img ?? '',
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
              (notifyModel.title ?? ''),
              style: AllStyles.text(_context).titleSmall,
            ),
            Text(notifyModel.subTitle ?? '',
                style: AllStyles.text(_context).labelSmall),
            Text(notifyModel.time ?? '',
                style: AllStyles.text(_context).bodySmall),
          ],
        ),
      );

  Widget showMore() =>
      const SizedBox(width: 30, child: Icon(Icons.more_vert_rounded));
}
