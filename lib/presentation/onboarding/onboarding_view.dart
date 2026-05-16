import 'package:clean_architect/presentation/onboarding/onboarding_bottom_sheet.dart';
import 'package:clean_architect/presentation/onboarding/onboarding_page_view.dart';
import 'package:clean_architect/presentation/onboarding/onboarding_view_model.dart';
import 'package:clean_architect/presentation/resources/color_manager.dart';
import 'package:clean_architect/presentation/resources/route_manager.dart';
import 'package:clean_architect/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _pageController;
  final _viewModel = OnboardingViewModel();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: OnboardingViewModel.sliderInitialIndex,
    );
    _bindData();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _bindData() {
    _viewModel.start();
  }

  void _onPageChanged(int index) {
    _viewModel.onPageChanged(index);
  }

  void _onNextSlide() {
    _pageController.animateToPage(
      _viewModel.goNext(),
      duration: const Duration(milliseconds: DurationConstant.d300),
      curve: Curves.easeInOut,
    );
  }

  void _onPreviousSlide() {
    _pageController.animateToPage(
      _viewModel.goPrevious(),
      duration: const Duration(milliseconds: DurationConstant.d300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return _buildViewContent(snapshot.data!);
        } else {
          return _buildLoading();
        }
      },
    );
  }

  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildViewContent(SliderViewObject view) {
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
          itemCount: view.numOfSlide,
          itemBuilder: (context, index) {
            final page = _viewModel.listPage[index];
            return OnBoardingPageView(page);
          },
          onPageChanged: _onPageChanged,
        ),
      ),
      bottomSheet: OnboardingBottomSheet(
        list: _viewModel.listPage,
        currentIndex: view.currentIndex,
        onSkip: () {
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
        },
        onNextSlide: _onNextSlide,
        onPreviousSlide: _onPreviousSlide,
      ),
    );
  }
}
