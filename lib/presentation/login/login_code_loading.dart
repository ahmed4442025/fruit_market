import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/app/functions/cubits/login/login_cubit.dart';
import 'package:fruit_market/app/functions/cubits/login/login_states.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';

class LoginCodeLoading extends StatelessWidget {
  LoginCodeLoading({Key? key}) : super(key: key);
  late BuildContext _context;
  late LoginCubit _cubit;
  late bool isLoading;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        isLoading = state is LoginSendingCodeState;
        _context = context;
        _cubit = LoginCubit.get(context);
        return myScaffold();
      },
    );
  }

  Scaffold myScaffold() => Scaffold(
        body: Center(
          child: Column(
            children: isLoading ? loadingBody() : okBody(),
          ),
        ),
      );

  List<Widget> loadingBody() => [
        UtilM.box100(),
        UtilM.randomLoading(),
        UtilM.box40(),
        const Text('Verifying Your Mobile Number'),
      ];

  List<Widget> okBody() => [
        UtilM.box100(),
        UtilM.box100(),
        const Icon(
          Icons.check_circle_outline_sharp,
          size: 100,
          color: ColorManager.primary,
        ),
        UtilM.box60(),
        const Text('Verification Code Send on\nyour Registered Mobile Number ',
            textAlign: TextAlign.center),
      ];
}
