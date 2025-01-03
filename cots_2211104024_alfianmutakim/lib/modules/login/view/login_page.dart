import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header dengan logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back, color: AppColors.black),
                  ),
                  Image.asset('assets/images/gojek.png', width: 100),
                  Icon(Icons.help_outline, color: AppColors.black),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Form login
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Login',
                      style: AppTypography.h1,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Enter your registered phone number to log in',
                      style: AppTypography.subhead2.copyWith(
                        color: AppColors.greyMedium,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 24),

                    // Input nomor telepon
                    TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) => controller.phoneNumber.value = value,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '+62',
                            style: AppTypography.bodyText,
                          ),
                        ),
                        labelText: 'Phone number',
                        border: OutlineInputBorder(),
                        suffixIcon: Obx(() => controller.phoneNumber.value.isEmpty
                            ? null
                            : IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () => controller.phoneNumber.value = '',
                              )),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Issue with number link
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          // Navigasi ke halaman bantuan
                        },
                        child: Text(
                          'Issue with number?',
                          style: AppTypography.bodyText.copyWith(
                            color: AppColors.primaryBlue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Tombol login
                    Obx(() {
                      return ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () => controller.login(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                        ),
                        child: controller.isLoading.value
                            ? CircularProgressIndicator(
                                color: AppColors.white,
                              )
                            : Text(
                                'Continue',
                                style: AppTypography.bodyText.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            // Keyboard visual padding
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
