import 'package:cots_2211104024_alfianmutakim/design_system/colors.dart';
import 'package:cots_2211104024_alfianmutakim/design_system/typography.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      title: TextField(
        decoration: InputDecoration(
          hintText: "Find services, food, or places",
          hintStyle:
              AppTypography.subhead2.copyWith(color: AppColors.greyMedium),
          prefixIcon: const Icon(Icons.search, color: AppColors.greyMedium),
          filled: true,
          fillColor: AppColors.greyLight,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildGopaySection(),
        const SizedBox(height: 20),
        _buildServicesSection(),
        const SizedBox(height: 20),
        _buildPromosSection(),
      ],
    );
  }

  Widget _buildGopaySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 3, 107, 131), // Gopay blue color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rp 7.434", // Perubahan nilai Rp
                      style: AppTypography.h2.copyWith(color: AppColors.white)),
                  Text("Tap for history", // Perubahan teks
                      style: AppTypography.subhead3
                          .copyWith(color: AppColors.white.withOpacity(0.7))),
                ],
              ),
              const Icon(Icons.qr_code, color: AppColors.white),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _GopayIcon(
                image: '../../../../assets/icons/topup.png',
                label: "Top Up",
              ),
              _GopayIcon(
                image: '../../../../assets/icons/pay.png',
                label: "Pay",
              ),
              _GopayIcon(
                image: '../../../../assets/icons/explore.png',
                label: "Explore",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection() {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        _ServiceIcon(
          image: '../../../../assets/icons/goride.png',
          label: "GoRide",
        ),
        _ServiceIcon(
          image: '../../../../assets/icons/gocar.png',
          label: "GoCar",
        ),
        _ServiceIcon(
          image: '../../../../assets/icons/gofood.png',
          label: "GoFood",
        ),
        _ServiceIcon(
          image: '../../../../assets/icons/gosend.png',
          label: "GoSend",
        ),
        _ServiceIcon(
          image: '../../../../assets/icons/gopulsa.png',
          label: "GoPulsa",
        ),
        _ServiceIcon(
          image: '../../../../assets/icons/gomart.png',
          label: "GoMart",
        ),
        _ServiceIcon(
          image: '../../../../assets/icons/goclub.png',
          label: "GoClub",
        ),
        _ServiceIcon(image: '../../../../assets/icons/more.png', label: "More"),
      ],
    );
  }

  Widget _buildPromosSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align to the start
      children: [
        Padding(
          // Added padding for the "Restos near me" text
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("121 XP to your next Treasure",
              style:
                  AppTypography.subhead3.copyWith(color: AppColors.greyMedium)),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8), // Reduced border radius
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Restos near me", style: AppTypography.h4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.greyMedium,
                  ), // Added arrow icon
                ],
              )),
        ),
        const SizedBox(height: 10),
        const _PromoCard(
          imageUrl: '../../../../assets/images/vektor1.png',
          title: "Makin Seru",
          description:
              "Aktifkan & Sambungkan GoPay & GoPayLater di Tokopedia", // Perubahan teks
        ),
        const _PromoCard(
          imageUrl: '../../../../assets/images/vektor2.png',
          title: "Makin Seru",
          description:
              "Sambungkan Akun ke Tokopedia, Banyakin Untung", // Perubahan teks
        ),
        const _PromoCard(
          imageUrl: '../../../../assets/images/vektor3.png',
          title: "Bayar Apa Aja",
          description:
              "Promo Belanja Online 10.10: Cashback hingga Rp150.000", // Perubahan teks
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("../../../../assets/icons/home.png")),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("../../../../assets/icons/promosi.png")),
          label: "Payments",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("../../../../assets/icons/order.png")),
          label: "Offers",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("../../../../assets/icons/pesan.png")),
          label: "Chat",
        ),
      ],
    );
  }
}

class _GopayIcon extends StatelessWidget {
  final String image;
  final String label;

  const _GopayIcon({required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, height: 40, width: 40),
        const SizedBox(height: 5),
        Text(label, style: AppTypography.h7.copyWith(color: AppColors.white)),
      ],
    );
  }
}

class _ServiceIcon extends StatelessWidget {
  final String image;
  final String label;

  const _ServiceIcon({required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(image, height: 40, width: 40),
        const SizedBox(height: 5),
        Text(label, style: AppTypography.subhead3),
      ],
    );
  }
}

class _PromoCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const _PromoCard({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.h5),
                Text(description, style: AppTypography.paragraph2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
