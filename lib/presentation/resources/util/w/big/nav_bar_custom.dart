import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/functions/cubits/app/app_cubit.dart';
import '../../../../../app/functions/cubits/app/app_states.dart';
import '../../../color_manager.dart';

class NavBarCustom extends StatelessWidget {
  NavBarCustom({Key? key}) : super(key: key);
  late BuildContext _context;
  late AppCubit _cubit;



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        _context = context;
        _cubit = AppCubit.get(context);
        return Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorManager.lightGrey,
                spreadRadius: 1,
                blurRadius: 40,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: BottomNavigationBar(
              onTap: (i) {
                _cubit.changeNavIndex(i);
              },
              currentIndex: _cubit.navIndex,
              type: BottomNavigationBarType.fixed,
              items: _cubit.navWidgets),
        );
      },
    );
  }
}

class _NavItem {
  final IconData icon;
  final Text label;
  final Widget screen;

  _NavItem({required this.icon, required this.label, required this.screen});
}
