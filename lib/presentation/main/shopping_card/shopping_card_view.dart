import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';
import '../../../app/functions/cubits/app/app_cubit.dart';
import '../../../app/functions/cubits/app/app_states.dart';
import '../../resources/util/util_manager.dart';

class ShoppingCardView extends StatelessWidget {
  ShoppingCardView({Key? key}) : super(key: key);
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
      appBar: UtilM.appBar(showNotification: false, name: 'ShoppingCard'),
    body: const Center(
        child: Text('ShoppingCardView')),
  );
}
