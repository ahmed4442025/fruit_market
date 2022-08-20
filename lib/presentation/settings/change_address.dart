import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';
import '../../app/functions/cubits/app/app_cubit.dart';
import '../../app/functions/cubits/app/app_states.dart';
import '../resources/util/util_manager.dart';

class SettingsAddressView extends StatelessWidget {
  SettingsAddressView({Key? key}) : super(key: key);
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
            name: 'Change Address',
            showNotification: false,
            onBack: () => ViewsManager.backIfUCan(_context)),
        body: Padding(
          padding: const EdgeInsets.all(AppSize.s14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UtilM.box15(),
              Text(
                'Address',
                style: AllStyles.text(_context).bodyLarge,
              ),
              UtilM.box15(),
               TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                style: AllStyles.text(_context).headlineMedium,
              ),
              UtilM.box100(),
              UtilM.buttonText(
                  text: "Change", onTap: () {}, width: double.infinity)
            ],
          ),
        ),
      );
}
