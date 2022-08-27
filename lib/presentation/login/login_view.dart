import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/app/functions/cubits/login/login_cubit.dart';
import 'package:fruit_market/app/functions/cubits/login/login_states.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';
import 'package:fruit_market/presentation/resources/image_assets.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';

import '../resources/all_styles.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  late BuildContext _context;
  late LoginCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        _context = context;
        _cubit = LoginCubit.get(context);
        return myScaffold();
      },
    );
  }

  Scaffold myScaffold() => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: ListView(
            children: [
              img(),
              title(),
              UtilM.box20(),
              textfield(),
              or(),
              googleOrFB()
            ],
          ),
        ),
      );

  Widget img() => Image.asset(ImageAssets.marketLogo);

  Widget title() => Text(
        'Fruit Market',
        textAlign: TextAlign.center,
        style: AllStyles.text(_context)
            .headlineLarge!
            .copyWith(color: ColorManager.primary),
      );

  Widget textfield() => TextField(
        decoration: const InputDecoration(hintText: 'Enter Your Mobile Number'),
        readOnly: true,
        onTap: () => ViewsManager.openWBLoginConfirmPhone(_context),
      );

  Widget or() => const Padding(
        padding: EdgeInsets.symmetric(vertical: AppPadding.p50),
        child: Text('OR', textAlign: TextAlign.center),
      );

  Widget googleOrFB() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OutlinedButton.icon(
            onPressed: () {},
            icon: Image.asset(
              ImageAssets.googleLogo,
              height: 50,
            ),
            label: Text(
              'Google',
              style: AllStyles.text(_context).bodyMedium,
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Image.asset(
              ImageAssets.faceBookLogo,
              height: 50,
            ),
            label: Text(
              'FaceBook',
              style: AllStyles.text(_context).bodyMedium,
            ),
          ),
        ],
      );
}
