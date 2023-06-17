
import 'package:bitcoin/screens/bitcoin_screen.dart';
import 'package:bitcoin/screens/bitcoin_binding.dart';
import 'package:bitcoin/screens/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.defaultRoute;

  static final all = [
    GetPage(
      name: AppRoutes.defaultRoute,
      page: () => const SplashScreen(),
    ),

    GetPage(
      name: AppRoutes.bitcoinScreen,
      page: () => const Bitcoin(),
      binding: BitcoinBinding(),
    ),
  ];
}
