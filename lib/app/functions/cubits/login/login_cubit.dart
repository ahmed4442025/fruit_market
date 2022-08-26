import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void init() {
    keyBoardPhone =
        UtilM.keyboardNum(onChange: (_phone) => changePhone(_phone));
  }

  // phone view
  late Widget keyBoardPhone;

  // phone
  String phone = '';
  String countryCode = '+2';

  changePhone(String newPhone) {
    phone = newPhone;
    emit(LoginChangePhoneState());
  }
  changeCountryCode(String newCountryCode) {
    countryCode = newCountryCode;
    // print('cubit : countryCode change to $countryCode');
    emit(LoginChangePhoneState());
  }
}
