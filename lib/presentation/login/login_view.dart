import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/app/functions/cubits/login/login_cubit.dart';
import 'package:fruit_market/app/functions/cubits/login/login_states.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';

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
        body: Center(
          child: SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () => ViewsManager.openWBLoginLoading(_context),
                    child: const Text('openWBLoginLoading')),
                InkWell(
                    onTap: () => ViewsManager.openWBLoginConfirmCode(_context),
                    child: const Text('openWBLoginConfirmCode')),
                InkWell(
                    onTap: () => ViewsManager.openWBLoginConfirmPhone(_context),
                    child: const Text('openWBLoginConfirmPhone')),
                InkWell(
                    onTap: () => ViewsManager.openLoginInit(_context),
                    child: const Text('openLoginInit')),
              ],
            ),
          ),
        ),
      );
}
