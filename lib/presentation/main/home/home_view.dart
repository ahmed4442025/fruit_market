import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';
import '../../../app/functions/cubits/app/app_cubit.dart';
import '../../../app/functions/cubits/app/app_states.dart';

class HomeNavView extends StatelessWidget {
  HomeNavView({Key? key}) : super(key: key);
  late BuildContext _context;
  late AppCubit _cubit;
  bool showSearch = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        _context = context;
        _cubit = AppCubit.get(context);
        return Stack(
          alignment: Alignment.center,
          children: [
            // body
            myScaffold(),
            // search field
            UtilM.searchTextField(appBarHeight2: AppSize.s90)
          ],
        );
      },
    );
  }

  Scaffold myScaffold() => Scaffold(
      // app bar
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSize.s90),
          child: UtilM.appBar(
            showNotification: true,
              name: 'home',
              notificationCount: _cubit.getNotifyCount(),
              onNotify: () => ViewsManager.openWBNotifyView(_context))),
      // body
      body: ListView.builder(
          itemCount: _cubit.groupOfFruits.length + 1,
          itemBuilder: (c, i) {
            if (i == 0) {
              // header
              return Column(
                children: [
                  UtilM.box60(),
                  // chose type
                  Center(child: UtilM.fruitTypesLabels()),
                  UtilM.box20(),
                ],
              );
            }
            // groups categories
            return UtilM.fruitGroup(_cubit.groupOfFruits[i - 1]);
          }));
}
