import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/app/functions/cubits/login/login_cubit.dart';
import 'package:fruit_market/app/functions/cubits/login/login_states.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';
import 'package:country_picker/country_picker.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';

import '../resources/values_manager.dart';

class ConfirmMobileView extends StatelessWidget {
  ConfirmMobileView({Key? key}) : super(key: key);
  late BuildContext _context;
  late LoginCubit _cubit;

  TextEditingController phoneCtr = TextEditingController();
  TextEditingController cCodeCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        _context = context;
        _cubit = LoginCubit.get(context);
        phoneCtr.text = toPhoneNum(_cubit.phone);
        cCodeCtr.text = _cubit.countryCode;
        return myScaffold();
      },
    );
  }

  Scaffold myScaffold() => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UtilM.box5(),
                textPhone(),
                UtilM.buttonText(
                    text: 'VERIFY',
                    onTap: () => onVerify(),
                    width: double.infinity),
                _cubit.keyBoardPhone,
              ],
            ),
          ),
        ),
      );

  // phone and code
  Widget textPhone() => TextField(
        controller: phoneCtr,
        readOnly: true,
        decoration: InputDecoration(
            // code
            prefixIcon: Padding(
          padding: const EdgeInsets.only(right: AppPadding.p10),
          child: SizedBox(
              width: getCodeSize(),
              child: TextField(
                onTap: () => getCode(),
                textAlign: TextAlign.center,
                controller: cCodeCtr,
                readOnly: true,
              )),
        )),
      );

  // size of small text field
  double getCodeSize() {
    double siz = _cubit.countryCode.length * 20;
    return siz < 50 ? 50 : siz;
  }

  // open CountryPicker
  void getCode() {
    showCountryPicker(
      context: _context,
      showPhoneCode: true,
      favorite: <String>['EG'],
      onSelect: (Country country) {
        _cubit.changeCountryCode('+${country.phoneCode}');
      },
    );
  }

  void onVerify() {
    // send code and open code confirm view if => (success)
    _cubit.sendCode(() => ViewsManager.openLoginConfirmCode(_context));
    // open loading view any way
    ViewsManager.openWBLoginLoading(_context);
  }

  String toPhoneNum(String text) {
    return text.replaceAllMapped(RegExp(r'(\d{3})(\d{3})(\d+)'),
        (Match m) => "(${m[1]}) ${m[2]}-${m[3]}");
  }
}
