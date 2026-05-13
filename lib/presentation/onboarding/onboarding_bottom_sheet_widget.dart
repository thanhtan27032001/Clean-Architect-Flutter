import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:clean_architect/presentation/onboarding/onboarding_view.dart';
import 'package:clean_architect/presentation/resources/asset_manager.dart';
import 'package:clean_architect/presentation/resources/values_manager.dart'
    show AppPadding, AppSize;

class OnboardingBottomSheetWidget extends StatelessWidget {
  final List<SliderObject> list;
  final int currentIndex;
  final void Function()? onNextSlide;
  final void Function()? onPreviousSlide;

  const OnboardingBottomSheetWidget({
    super.key,
    required this.list,
    required this.currentIndex,
    this.onNextSlide,
    this.onPreviousSlide,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // left arrow
        Padding(
          padding: EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            onTap: onPreviousSlide,
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.leftArrowIc),
            ),
          ),
        ),

        // circles indicator
        Row(
          children: [
            for (int i = 0; i < list.length; i++)
              Padding(
                padding: EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i),
              ),
          ],
        ),

        // right arrow
        Padding(
          padding: EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            onTap: onNextSlide,
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.rightarrowIc),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getProperCircle(int index) {
    if (index != currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc); // selected slider
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc); // unselected slider
    }
  }
}
