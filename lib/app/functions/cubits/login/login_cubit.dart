import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/app/functions/shared/cache_manager.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void init() {
    keyBoardPhone =
        UtilM.keyboardNum(onChange: (_phone) => changePhone(_phone));
    keyBoardCode =
        UtilM.keyboardNum(onChange: (code) => changeCodeConfirm(code), max: 6);
  }

  // phone view
  late Widget keyBoardPhone;
  late Widget keyBoardCode;

  // phone
  String phone = '';
  String countryCode = '+2';
  String codeConfirm = 'xxxxxx';

  changePhone(String newPhone) {
    phone = newPhone;
    emit(LoginChangePhoneState());
  }

  changeCountryCode(String newCountryCode) {
    countryCode = newCountryCode;
    emit(LoginChangePhoneState());
  }

  changeCodeConfirm(String newCodeConfirm) {
    codeConfirm = newCodeConfirm;
    emit(LoginChangeCodeState());
  }

  // phone auth
  void sendCode(BuildContext context) async {
    const int sec = 3;
    print('sending Code');
    emit(LoginSendingCodeState());
    await Future.delayed(const Duration(seconds: sec));
    print('success send code to u phone');
    emit(LoginSendOkCodeState());
    await Future.delayed(const Duration(seconds: 1));
    // if success open loading view
    ViewsManager.openLoginConfirmCode(context);
  }

  // confirm code
  void confirmCode(BuildContext context) async {
    const int sec = 3;
    print('confirming Code');
    emit(LoginSendingCodeState());
    await Future.delayed(const Duration(seconds: sec));
    print('success confirming $codeConfirm');
    emit(LoginSendOkCodeState());
    await Future.delayed(const Duration(seconds: 1));
    // if success open loading view
    CacheGet.setIsLogin(true);
    ViewsManager.openLoginInit(context);
  }


  // log out
  void logOut(BuildContext context) {
    CacheGet.setIsLogin(false);
    ViewsManager.openLoginMain(context);
  }
}
