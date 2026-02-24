
import 'package:ChatHub/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/constant/app_route.dart';
import 'home_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.splash, page: ()=>SplashScreen()),
  // GetPage(name: AppRoute.onboard, page: ()=>OnboardScreen()),
  // GetPage(name: AppRoute.login, page: ()=>LoginScreen()),
  GetPage(name: AppRoute.home, page: ()=>HomeScreen()),
  // GetPage(name: AppRoute.profileSetup, page: ()=>ProfileSetup()),
  // GetPage(name: AppRoute.contact, page: ()=>ContactScreen()),
  // GetPage(name: AppRoute.chatDetail, page: ()=>ChatDetailScreen()),

];