import 'package:cots_2211104024_alfianmutakim/modules/login/controller/login_controller.dart';
import 'package:cots_2211104024_alfianmutakim/modules/login/view/login_page.dart';
import 'package:cots_2211104024_alfianmutakim/modules/main/view/main_page.dart';
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
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      }),
    ),
    GetPage(
      name: '/home', // atau nama rute yang sesuai
      page: () => MainPage(), // Ganti MainPage() dengan widget Anda
    ),

    // Tambahkan halaman lain di sini
  ];
}
