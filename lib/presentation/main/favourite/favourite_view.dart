import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';
import '../../../app/functions/cubits/app/app_cubit.dart';
import '../../../app/functions/cubits/app/app_states.dart';

class FavouriteView extends StatelessWidget {
  FavouriteView({Key? key}) : super(key: key);
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
        appBar: UtilM.appBar(showNotification: false, name: 'Favourite'),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView.separated(
            itemCount: _cubit.groupOfFruits[0].list.length,
            itemBuilder: (c, i) =>
                UtilM.fruitCardFav(_cubit.groupOfFruits[0].list[i]),
            separatorBuilder: (cs, i) => const Divider(height: 30),
          ),
        ),
      );


}
