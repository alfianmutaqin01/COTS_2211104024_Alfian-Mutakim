import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Memisahkan elemen atas dan tombol bawah
            children: [
              // Bagian atas: Header, teks, dan form
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          './../../../assets/icons/back.png',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () => Get.back(),
                      ),
                      Image.asset(
                        '../../../../assets/images/gojek.png',
                        width: 90,
                      ),
                      Spacer(),
                      IconButton(
                        icon: Image.asset(
                          './../../../assets/icons/tanya.png',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          // Navigasi ke halaman bantuan
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Teks Header
                  Text(
                    'Login',
                    style: AppTypography.h1.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enter your registered phone number to log in',
                    style: AppTypography.bodyText
                        .copyWith(color: AppColors.greyMedium),
                  ),
                  const SizedBox(height: 24),
                  // Input Nomor Telepon
                  TextField(
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => controller.phoneNumber.value = value,
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 0),
                        decoration: BoxDecoration(
                          color: AppColors.greyLight,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: AppColors.greyMedium,
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              '../../../../assets/icons/indonesia.png',
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '+62',
                              style: AppTypography.bodyText
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(minWidth: 80, minHeight: 48),
                      labelText: 'Phone number',
                      suffixIcon: controller.phoneNumber.value.isEmpty
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () =>
                                  controller.phoneNumber.value = '',
                            ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Link untuk masalah nomor
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        // Navigasi ke halaman "Issue with number?"
                      },
                      child: Text(
                        'Issue with number?',
                        style: AppTypography.bodyText
                            .copyWith(color: AppColors.primaryGreen),
                      ),
                    ),
                  ),
                ],
              ),
              // Tombol di bawah
              Obx(() {
                return SizedBox(
                  width: double
                      .infinity, // Tombol akan memenuhi lebar maksimum yang tersedia
                  child: ElevatedButton(
                    onPressed: controller.phoneNumber.value.isEmpty
                        ? null
                        : () => controller.login(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: AppColors.white)
                        : Text(
                            'Continue',
                            style: AppTypography.h4
                                .copyWith(color: AppColors.white),
                          ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
