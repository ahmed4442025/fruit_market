import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';
import '../../app/functions/cubits/app/app_cubit.dart';
import '../../app/functions/cubits/app/app_states.dart';

class SettingsAccView extends StatelessWidget {
  SettingsAccView({Key? key}) : super(key: key);
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
            name: 'Account Settings',
            showNotification: false,
            onBack: () => ViewsManager.backIfUCan(_context)),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UtilM.iconButton(
                  _context, () {}, Icons.security, 'Security'),
              const Divider(),
              UtilM.iconButton(
                  _context, () {}, Icons.remove_circle_rounded, 'Deactivate Account'),
              const Divider(),
              UtilM.iconButton(
                  _context, () {}, Icons.delete, 'Delete Account'),


            ],
          ),
        ),
      );
}
