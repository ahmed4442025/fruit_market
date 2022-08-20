import 'package:flutter/material.dart';
import 'package:fruit_market/app/functions/shared/cache_manager.dart';
import 'package:fruit_market/presentation/resources/all_styles.dart';
import 'package:fruit_market/presentation/resources/image_assets.dart';
import 'package:fruit_market/presentation/resources/strings_manager.dart';
import 'package:fruit_market/presentation/resources/util/util_manager.dart';
import 'package:fruit_market/presentation/resources/values_manager.dart';
import 'package:fruit_market/presentation/resources/views_sort_manager.dart';
import '../resources/color_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<_Slider> _sliders = getSliders();
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late BuildContext _context;

  List<_Slider> getSliders() => [
        _Slider(ImageAssets.onBoardingLogo1, StringsManager.onBeardingTitle1,
            StringsManager.onBeardingSubTitle1),
        _Slider(ImageAssets.onBoardingLogo2, StringsManager.onBeardingTitle2,
            StringsManager.onBeardingSubTitle2),
        _Slider(ImageAssets.onBoardingLogo3, StringsManager.onBeardingTitle3,
            StringsManager.onBeardingSubTitle3),
      ];

  @override
  Widget build(BuildContext context) {
    _context = context;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: Column(
          children: [
            UtilM.box40(),
            // skip
            Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: onSkip,
                  child: Text(
                    StringsManager.skip,
                    style: AllStyles.text(context).titleMedium,
                  ),
                ),
                UtilM.box20()
              ],
            ),
            // pages
            UtilM.box40(),
            UtilM.box40(),
            SizedBox(
              height: 350,
              child: PageView.builder(
                itemCount: _sliders.length,
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) => _onBoardingBody(
                  slider: _sliders[i],
                ),
                onPageChanged: (i) {
                  setState(() {
                    _currentIndex = i;
                  });
                },
              ),
            ),
            // scroll

            UtilM.box15(),
            SmoothPageIndicator(
              controller: _pageController,
              count: _sliders.length,
              effect: const SlideEffect(
                dotColor: ColorManager.lightGrey,
                activeDotColor: ColorManager.primary,
                paintStyle: PaintingStyle.stroke,
                dotWidth: AppSize.s12,
                dotHeight: AppSize.s12,
              ),
            ),
            // next
            UtilM.box20(),
            UtilM.buttonText(
                text: _currentIndex == _sliders.length - 1 ? 'start' : 'Next',
                onTap: onNext),
          ],
        ),
      ),
    );
  }

  void onNext() {
    if (_currentIndex < _sliders.length-1) {
      print("${_currentIndex} < ${_sliders.length}");
      _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate);
    }else{
      onSkip();
    }
  }

  void onSkip() {
    CacheGet.setSkipIntro(true);
    ViewsManager.tempHome(context);
  }
}

class _Slider {
  final String img;
  final String title;
  final String subTitle;

  _Slider(this.img, this.title, this.subTitle);
}

class _onBoardingBody extends StatelessWidget {
  final _Slider slider;

  const _onBoardingBody({Key? key, required this.slider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 700,
      color: Colors.grey.shade50,
      child: Column(
        children: [
          SizedBox(height: 200, child: Image.asset(slider.img)),
          UtilM.box40(),
          Text(
            slider.title,
            style: AllStyles.text(context).displayLarge,
          ),
          UtilM.box20(),
          Text(
            slider.subTitle,
            maxLines: 2,
            style: AllStyles.text(context).titleMedium,
          ),
        ],
      ),
    );
  }
}
