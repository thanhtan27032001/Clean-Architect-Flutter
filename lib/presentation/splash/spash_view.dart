import 'dart:async';

import 'package:clean_architect/presentation/resources/asset_manager.dart';
import 'package:clean_architect/presentation/resources/color_manager.dart';
import 'package:clean_architect/presentation/resources/route_manager.dart';
import 'package:flutter/material.dart';

class SpashView extends StatefulWidget {
  const SpashView({super.key});

  @override
  State<StatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends State<SpashView> {
  Timer? _timer;

  void _startDelay() {
    _timer = Timer(const Duration(seconds: 2), () {
      _goNext();
    });
  }

  void _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }
}

// class SpashView extends StatelessWidget {
//   const SpashView({super.key});

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         backgroundColor: ColorManager.primary,
//         body: Center(child: Image(image: AssetImage(ImaageAssets.splashLogo))),
//       );
//     }
// }
