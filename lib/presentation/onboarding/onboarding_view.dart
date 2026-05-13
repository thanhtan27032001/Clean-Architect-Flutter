import 'package:clean_architect/presentation/onboarding/onboarding_bottom_sheet.dart';
import 'package:clean_architect/presentation/onboarding/onboarding_page_view.dart';
import 'package:clean_architect/presentation/resources/asset_manager.dart';
import 'package:clean_architect/presentation/resources/color_manager.dart';
import 'package:clean_architect/presentation/resources/route_manager.dart';
import 'package:clean_architect/presentation/resources/string_manager.dart';
import 'package:clean_architect/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _listPage = _getSliderData();
  int _currentIndex = 0;
  late final PageController _pageController;

  List<SliderObject> _getSliderData() => [
    SliderObject(
      AppStrings.onBoardingTitle1,
      AppStrings.onBoardingSubTitle1,
      ImageAssets.onboardingLogo1,
    ),
    SliderObject(
      AppStrings.onBoardingTitle2,
      AppStrings.onBoardingSubTitle2,
      ImageAssets.onboardingLogo2,
    ),
    SliderObject(
      AppStrings.onBoardingTitle3,
      AppStrings.onBoardingSubTitle3,
      ImageAssets.onboardingLogo3,
    ),
    SliderObject(
      AppStrings.onBoardingTitle4,
      AppStrings.onBoardingSubTitle4,
      ImageAssets.onboardingLogo4,
    ),
  ];

  void _onPageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
  }

  void _onNextSlide() {
    int nextIndex = _currentIndex + 1;
    if (nextIndex > _listPage.length - 1) {
      nextIndex = 0;
    }
    _pageController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: DurationConstant.d300),
      curve: Curves.easeInOut,
    );
  }

  void _onPreviousSlide() {
    int previousIndex = _currentIndex - 1;
    if (previousIndex < 0) {
      previousIndex = _listPage.length - 1;
    }
    _pageController.animateToPage(
      previousIndex,
      duration: const Duration(milliseconds: DurationConstant.d300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      // appBar: AppBar(
      //   elevation: AppSize.s0,
      //   backgroundColor: ColorManager.white,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: ColorManager.white,
      //     statusBarBrightness: Brightness.dark,
      //     statusBarIconBrightness: Brightness.dark,
      //   ),
      // ),
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: _listPage.length,
          itemBuilder: (context, index) {
            final page = _listPage[index];
            return OnBoardingPageView(page);
          },
          onPageChanged: _onPageChanged,
        ),
      ),
      bottomSheet: OnboardingBottomSheet(
        list: _listPage,
        currentIndex: _currentIndex,
        onSkip: () {
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
        },
        onNextSlide: _onNextSlide,
        onPreviousSlide: _onPreviousSlide,
      ),
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
