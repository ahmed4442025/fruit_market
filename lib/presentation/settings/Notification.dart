import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';
import '../../app/functions/cubits/app/app_cubit.dart';
import '../../app/functions/cubits/app/app_states.dart';
import '../resources/util/util_manager.dart';
import '../resources/values_manager.dart';

class SettingNotificationView extends StatelessWidget {
  SettingNotificationView({Key? key}) : super(key: key);
  late BuildContext _context;
  late AppCubit _cubit;

  bool myAccNotify = true;
  bool pramNotify = false;

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
            name: 'Notification Settings',
            showNotification: false,
            onBack: () => ViewsManager.backIfUCan(_context)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              value: _cubit.setNotifyAcc,
              title: Text(
                'My Account',
                style: AllStyles.text(_context).bodyLarge,
              ),
              subtitle: Text(
                'You will receive daily updates',
                style: AllStyles.text(_context).headlineMedium,
              ),
              onChanged: (b) {
                _cubit.changerNotifyAcc(b);
              },
              secondary: const Icon(
                Icons.notifications,
                size: AppSize.s30,
                color: ColorManager.primary,
              ),
            ),
            const Divider(),
            SwitchListTile(
              value: _cubit.setNotifyProm,
              title: Text(
                'Promotional Notifications',
                style: AllStyles.text(_context).bodyLarge,
              ),
              subtitle: Text(
                'You will receive daily updates',
                style: AllStyles.text(_context).headlineMedium,
              ),
              onChanged: (b) {
                _cubit.changerNotifyProm(b);
              },
              secondary: const Icon(
                Icons.notifications,
                size: AppSize.s30,
                color: ColorManager.primary,
              ),
            ),
          ],
        ),
      );
}
