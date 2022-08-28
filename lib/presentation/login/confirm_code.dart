import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/app/functions/cubits/login/login_cubit.dart';
import 'package:fruit_market/app/functions/cubits/login/login_states.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';

import '../resources/views_sort_manager.dart';

class ConfirmCodeView extends StatelessWidget {
  ConfirmCodeView({Key? key}) : super(key: key);
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
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UtilM.box20(),
                  const Text(
                      "Enter The 4 digit code that was\nsend to your Mobile Number"),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: UtilM.code6(text: _cubit.codeConfirm),
                  ),
                  UtilM.buttonText(
                      text: 'VERIFY',
                      onTap: () => onVerify(),
                      width: double.infinity),
                  reSendCode(),
                  UtilM.box40(),
                  _cubit.keyBoardCode
                ],
              ),
            ),
          ),
        ),
      );

  Widget reSendCode() => Row(
        children: [
          const Spacer(),
          TextButton(
              onPressed: () => onResend(),
              child: const Text(
                'Resend Again?',
                style: TextStyle(color: Colors.blue),
              )),
        ],
      );

  void onVerify() {
    _cubit.confirmCode(_context);
    ViewsManager.openWBLoginLoading(_context);
  }

  void onResend() {
    // send code and open code confirm view if => (success)
    _cubit.sendCode(_context);
    // open loading view any way
    ViewsManager.openWBLoginLoading(_context);
  }
}
