import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fruit_market/presentation/resources/strings_manager.dart';
import '../resources/all_styles.dart';
import '../resources/app_constants.dart';
import '../resources/color_manager.dart';
import '../resources/image_assets.dart';
import '../resources/views_sort_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer1;

  _startDelay() {
    _timer1 = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  void _goNext() => ViewsManager.homeAfterSplash(context);

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: Stack(
          children: [
            // image
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                Image.asset(ImageAssets.splashLogo, fit: BoxFit.fitWidth),
              ],
            ),
            // center text
            Center(
              child: Text(
                StringsManager.appName,
                style: AllStyles.text(context).headlineLarge,
              ),
            )
          ],
        ));
  }

  @override
  void dispose() {
    _timer1?.cancel();
    super.dispose();
  }
}
