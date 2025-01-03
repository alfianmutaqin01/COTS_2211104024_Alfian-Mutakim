import 'package:get/get.dart';

class MainController extends GetxController {
  // Contoh variabel yang bisa digunakan
  var searchQuery = ''.obs;
  var currentPage = 0.obs;

  // Fungsi untuk update pencarian
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  // Fungsi untuk update halaman
  void updatePage(int index) {
    currentPage.value = index;
  }
}
