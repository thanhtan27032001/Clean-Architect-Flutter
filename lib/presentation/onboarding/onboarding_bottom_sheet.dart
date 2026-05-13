import 'package:clean_architect/presentation/onboarding/onboarding_bottom_sheet_widget.dart';
import 'package:clean_architect/presentation/onboarding/onboarding_view.dart';
import 'package:clean_architect/presentation/resources/color_manager.dart';
import 'package:clean_architect/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';

class OnboardingBottomSheet extends StatelessWidget {
  final List<SliderObject> list;
  final int currentIndex;
  final void Function()? onSkip;
  final void Function()? onNextSlide;
  final void Function()? onPreviousSlide;

  const OnboardingBottomSheet({
    super.key,
    required this.list,
    required this.currentIndex,
    this.onSkip,
    this.onNextSlide,
    this.onPreviousSlide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onSkip,
              child: Text(AppStrings.skip, textAlign: TextAlign.end),
            ),
          ),
          // add layout for indicator and arrows
          Container(
            color: ColorManager.primary,
              child: OnboardingBottomSheetWidget(
                list: list,
                currentIndex: currentIndex,
                onNextSlide: onNextSlide,
                onPreviousSlide: onPreviousSlide,
              ),
          ),
        ],
      ),
    );
  }
}
