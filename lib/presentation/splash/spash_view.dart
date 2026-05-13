import 'package:clean_architect/presentation/resources/asset_manager.dart';
import 'package:clean_architect/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

// class SpashView extends StatefulWidget {
//   const SpashView({super.key});

//   @override
//   State<StatefulWidget> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SpashView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.primary,
//       body: Center(child: Image(image: AssetImage(ImaageAssets.splashLogo))),
//     );
//   }
// }

class SpashView extends StatelessWidget {
  const SpashView({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: ColorManager.primary,
        body: Center(child: Image(image: AssetImage(ImaageAssets.splashLogo))),
      );
    }
}
