import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/app/functions/cubits/app/app_cubit.dart';
import 'package:fruit_market/app/functions/cubits/app/app_states.dart';

import '../resources/all_styles.dart';
import '../resources/util/util_manager.dart';
import '../resources/values_manager.dart';

class InitAccView extends StatelessWidget {
  InitAccView({Key? key}) : super(key: key);
  late BuildContext _context;
  late AppCubit _cubit;
  TextEditingController ctrAdr = TextEditingController();
  TextEditingController ctrName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        _context = context;
        _cubit = AppCubit.get(context);
        ctrAdr.text = _cubit.setAddress;
        return myScaffold();
      },
    );
  }

  Scaffold myScaffold() => Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(AppSize.s14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name text field
                UtilM.box15(),
                Text(
                  'Enter Your Name',
                  style: AllStyles.text(_context).bodyLarge,
                ),
                UtilM.box15(),
                TextField(
                  controller: ctrName,
                  style: AllStyles.text(_context).headlineMedium,
                ),
                UtilM.box15(),

                // Address text field
                Text(
                  'Add Address',
                  style: AllStyles.text(_context).bodyLarge,
                ),
                UtilM.box15(),
                TextField(
                  controller: ctrAdr,
                  keyboardType: TextInputType.multiline,
                  maxLines: 6,
                  style: AllStyles.text(_context).headlineMedium,
                ),

                // VERIFY buttonText
                UtilM.box60(),
                UtilM.buttonText(
                    text: "VERIFY",
                    onTap: () => _cubit.changeAdr(ctrAdr.text),
                    width: double.infinity),
                UtilM.box100(),
              ],
            ),
          ),
        )),
      );
}
