import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';
import '../../../app/functions/cubits/app/app_cubit.dart';
import '../../../app/functions/cubits/app/app_states.dart';

class MyAccountView extends StatelessWidget {
  MyAccountView({Key? key}) : super(key: key);
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
        appBar: UtilM.appBar(showNotification: false),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profile(),
              ...sett(Icons.shopping_bag, 'My Orders'),
              ...sett(Icons.favorite, 'Favourites'),
              ...sett(Icons.settings, 'Settings',
                  onTap: () => ViewsManager.openWBSettPub(_context)),
              ...sett(Icons.shopping_cart, 'My Cart'),
              ...sett(Icons.groups, 'Rate us'),
              ...sett(Icons.share, 'Refer a Friend'),
              ...sett(Icons.question_mark_outlined, 'Help'),
              ...sett(Icons.logout, 'Log Out'),
            ],
          ),
        ),
      );

  Widget profile() => Container(
        color: ColorManager.primary,
        height: 200,
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            // UtilM.box40(),
            // image
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UtilM.box5(),
                CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(_cubit.user.img ?? '')),
                const Icon(
                  Icons.edit,
                  color: ColorManager.white,
                )
              ],
            ),
            // name
            UtilM.box15(),
            Text(
              _cubit.user.name ?? '',
              style: AllStyles.text(_context)
                  .bodyLarge!
                  .copyWith(color: ColorManager.white),
            ),
            // email
            UtilM.box10(),
            Text(
              _cubit.user.email ?? '',
              style: AllStyles.text(_context)
                  .titleSmall!
                  .copyWith(color: ColorManager.white),
            )
          ],
        ),
      );

  List<Widget> sett(IconData icon, String name, {VoidCallback? onTap}) => [
        UtilM.iconButton(_context, onTap ?? () {}, icon, name),
        Divider(),
      ];
}
