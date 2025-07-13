


import 'package:get/get.dart';


class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';


  static getInitialRoute() => splash;
  static getSplashRoute() => splash;
  static getOnboardingRoute() => onboarding;


  static List<GetPage> routes = [
  /*  GetPage(name: initial, page: () => const SplashScreenView()),
    GetPage(name: splash, page: () => const SplashScreenView()),*/


  ];
}