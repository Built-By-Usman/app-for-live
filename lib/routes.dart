
import 'package:ChatHub/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {

  static const home = '/';

  static final pages = <GetPage>[
    GetPage(
      name: home,
      page: () => SplashScreen(),
    ),
  ];
}
