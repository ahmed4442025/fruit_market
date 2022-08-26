import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';
import '../../app/functions/cubits/app/app_cubit.dart';
import '../../app/functions/cubits/app/app_states.dart';
import '../resources/util/util_manager.dart';

class SettingsLangView extends StatelessWidget {
  SettingsLangView({Key? key}) : super(key: key);
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
            name: 'Language Setting',
            showNotification: false,
            onBack: () => ViewsManager.backIfUCan(_context)),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Language',
                style: AllStyles.text(_context).labelMedium,
              ),
              UtilM.box10(),
              Row(
                children: [
                  const Text('Language'),
                  const Spacer(),
                  Center(
                    child: SizedBox(
                      width: 60,
                      height: 40,
                      child: DropdownButton<String>(
                          value: _cubit.selectedLang,
                          items: _cubit.langs
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (value) {
                            _cubit.changeLang(value);
                          }),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
}
