import 'dart:async';

import 'package:clean_architect/domain/model.dart';
import 'package:clean_architect/presentation/base/base_view_model.dart';
import 'package:clean_architect/presentation/resources/asset_manager.dart';
import 'package:clean_architect/presentation/resources/string_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInput, OnboardingViewModelOutput {

  static const sliderInitialIndex = 0;
  final StreamController<SliderViewObject> _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> listPage = _getSliderData();
  int _currentIndex = sliderInitialIndex;

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

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex + 1;
    if (nextIndex > listPage.length - 1) {
      nextIndex = 0;
    }
    // _pageController.animateToPage(
    //   nextIndex,
    //   duration: const Duration(milliseconds: DurationConstant.d300),
    //   curve: Curves.easeInOut,
    // );
    // _postDataToView();
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex - 1;
    if (previousIndex < 0) {
      previousIndex = listPage.length - 1;
    }
    // _pageController.animateToPage(
    //   previousIndex,
    //   duration: const Duration(milliseconds: DurationConstant.d300),
    //   curve: Curves.easeInOut,
    // );
    _postDataToView();
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink<SliderViewObject> get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream;

  void _postDataToView() {
    _streamController.sink.add(
      SliderViewObject(
        sliderObject: listPage[_currentIndex],
        numOfSlide: listPage.length,
        currentIndex: _currentIndex,
      ),
    );
  }
}

mixin OnboardingViewModelInput {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);
  Sink get inputSliderViewObject;
}

mixin OnboardingViewModelOutput {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlide;
  int currentIndex;

  SliderViewObject({
    required this.sliderObject,
    required this.numOfSlide,
    required this.currentIndex,
  });
}
