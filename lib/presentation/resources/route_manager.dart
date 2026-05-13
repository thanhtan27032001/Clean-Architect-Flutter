import 'package:clean_architect/presentation/fogot_password/forgot_password_view.dart';
import 'package:clean_architect/presentation/login/login_view.dart';
import 'package:clean_architect/presentation/main/main_view.dart';
import 'package:clean_architect/presentation/onboarding/onboarding_view.dart';
import 'package:clean_architect/presentation/register/register_view.dart';
import 'package:clean_architect/presentation/resources/string_manager.dart';
import 'package:clean_architect/presentation/splash/spash_view.dart';
import 'package:clean_architect/presentation/store_detail/store_detail_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

Route<dynamic> undefinedRoute() {
  return MaterialPageRoute(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(title: Text(AppStrings.noRouteFound)),
        body: Center(child: Text(AppStrings.noRouteFound)),
      );
    },
  );
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        {
          return MaterialPageRoute(builder: (_) => SpashView());
        }
      case Routes.onBoardingRoute:
        {
          return MaterialPageRoute(builder: (_) => OnboardingView());
        }
      case Routes.loginRoute:
        {
          return MaterialPageRoute(builder: (_) => LoginView());
        }
      case Routes.registerRoute:
        {
          return MaterialPageRoute(builder: (_) => RegisterView());
        }
      case Routes.forgotPasswordRoute:
        {
          return MaterialPageRoute(builder: (_) => ForgotPasswordView());
        }
      case Routes.mainRoute:
        {
          return MaterialPageRoute(builder: (_) => MainView());
        }
      case Routes.storeDetailsRoute:
        {
          return MaterialPageRoute(builder: (_) => StoreDetailView());
        }
      default:
        {
          return undefinedRoute();
        }
    }
  }
}
