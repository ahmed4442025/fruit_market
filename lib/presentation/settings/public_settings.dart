import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';
import '../../app/functions/cubits/app/app_cubit.dart';
import '../../app/functions/cubits/app/app_states.dart';
import '../resources/util/util_manager.dart';
import '../resources/values_manager.dart';

class SettingPublicView extends StatelessWidget {
  SettingPublicView({Key? key}) : super(key: key);
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
            name: 'Settings',
            onBack: () => ViewsManager.backIfUCan(_context)),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UtilM.iconButton(
                  _context,
                  () => ViewsManager.openWBSettAcc(_context),
                  Icons.account_circle_rounded,
                  'Account'),
              const Divider(),
              UtilM.iconButton(
                  _context,
                  () => ViewsManager.openWBSettNotify(_context),
                  Icons.notifications,
                  'Notification'),
              const Divider(),
              UtilM.iconButton(
                  _context,
                  () => ViewsManager.openWBSetLan(_context),
                  Icons.language,
                  'Language'),
              const Divider(),
              UtilM.iconButton(
                  _context,
                  () => ViewsManager.openWBSettAddress(_context),
                  Icons.location_on_outlined,
                  'address'),

            ],
          ),
        ),
      );
}
