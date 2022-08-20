import 'package:flutter/material.dart';
import 'package:fruit_market/presentation/resources/color_manager.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';

class AppBarCustom {
  final bool showNotification;
  final int notificationCount;
  final String name;
  final VoidCallback? onBack;

  const AppBarCustom(
      {Key? key,
      required this.showNotification,
      required this.notificationCount,
      required this.name,
      required this.onBack});

  appBar() => AppBar(
      title: Text(name),
      actions: [
        if (showNotification)
          _NamedIcon(
            iconData: Icons.notifications,
            notificationCount: notificationCount,
          )
      ],
      // back
      leading: onBack != null
          ? TextButton.icon(
              onPressed: onBack,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorManager.white,
              ),
              label: const Text(''))
          : null

      // leading: false ? Icon(Icons.css) : null,

      );
}

class _NamedIcon extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onTap;
  final int notificationCount;

  const _NamedIcon({
    Key? key,
    this.onTap,
    required this.iconData,
    this.notificationCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(iconData),
            if (notificationCount != 0)
            Positioned(
              top: 7,
              right: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
                alignment: Alignment.center,
                child: Text('$notificationCount'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
