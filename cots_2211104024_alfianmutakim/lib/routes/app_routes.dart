import 'package:cots_2211104024_alfianmutakim/modules/onboarding/bindings/onboarding_bindings.dart';
import 'package:cots_2211104024_alfianmutakim/modules/onboarding/view/onboarding_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: '/onboarding',
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    // GetPage(
    //   name: '/login',
    //   page: () => LoginPage(),
    //   binding: LoginBinding(),
    //   ),
    // Tambahkan halaman lain di sini
  ];
}
