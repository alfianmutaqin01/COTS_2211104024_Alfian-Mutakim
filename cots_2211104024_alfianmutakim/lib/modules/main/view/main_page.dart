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
      title: Row(
        children: [
          // Kolom pencarian
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.greyLight,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2), // Posisi bayangan
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Find services, food, or places",
                  hintStyle: AppTypography.subhead2
                      .copyWith(color: AppColors.greyMedium),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('../../../assets/icons/cari.png',
                        width: 20, height: 20), // Ikon pencarian
                  ),
                  filled: true,
                  fillColor: AppColors.greyLight,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10), // Spasi antara pencarian dan ikon

          // Ikon tambahan dengan bayangan
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // Posisi bayangan
                ),
              ],
            ),
            child: Image.asset('assets/icons/profile.png',
                width: 50, height: 50), // Ikon profile
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ListView(
          padding: const EdgeInsets.all(
              0), // Hilangkan padding agar gambar memenuhi lebar layar
          children: [
            const SizedBox(height: 20), // Jarak setelah gambar
            _buildGopaySection(),
            const SizedBox(height: 20),
            _buildServicesSection(),
            const SizedBox(height: 20),
            _buildPromosSection(),
            const SizedBox(height: 20),
            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5, // Menentukan bagian gambar yang ditampilkan
                child: Image.asset(
                  '../../../../assets/images/background.png',
                  fit: BoxFit.cover,
                  width: constraints.maxWidth, // Lebar sesuai ukuran layar
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildGopaySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 3, 107, 131), // Warna biru khas GoPay
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Pusatkan elemen secara vertikal
        children: [
          // Kolom 1: Logo GoPay, Saldo, dan "Tap for history" (Lebar 1:3, Background putih)
          Expanded(
            flex: 1, // Kolom pertama mengambil 1/3 dari lebar container
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white, // Background putih
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo GoPay
                  Image.asset(
                    'assets/images/gopay.png', // Path logo GoPay
                    height: 20, // Tinggi logo
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // Spasi antar elemen
                  // Saldo
                  Text(
                    "Rp7.434",
                    style: AppTypography.h2.copyWith(
                      color: Colors.black, // Teks hitam
                    ),
                  ),
                  const SizedBox(height: 5), // Spasi antar elemen
                  // "Tap for history"
                  Text(
                    "Tap for history",
                    style: AppTypography.h5.copyWith(
                      color: AppColors.greenDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16), // Spasi antara kolom pertama dan kedua

          // Kolom 2: Ikon "Top Up", "Pay", dan "Explore" (Lebar sisa 2:3)
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 12), // Tambahkan padding vertikal
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Spasi antar ikon
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Pusatkan elemen vertikal
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
            ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text("121 XP to your next Treasure",
              style:
                  AppTypography.subhead3.copyWith(color: AppColors.greyMedium)),
        ),
        const SizedBox(height: 10),
        const _PromoCard(
          imageUrl: 'assets/images/vektor1.png',
          title: "Makin Seru",
          description: "Aktifkan & Sambungkan GoPay & GoPayLater di Tokopedia",
        ),
        const _PromoCard(
          imageUrl: 'assets/images/vektor2.png',
          title: "Makin Seru",
          description: "Sambungkan Akun ke Tokopedia, Banyakin Untung",
        ),
        const _PromoCard(
          imageUrl: 'assets/images/vektor3.png',
          title: "Bayar Apa Aja",
          description: "Promo Belanja Online 10.10: Cashback hingga Rp150.000",
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/icons/home.png")),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/icons/promosi.png")),
          label: "Promosi",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/icons/order.png")),
          label: "Orders",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/icons/pesan.png")),
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
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            height: 230,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Menambahkan ini untuk memastikan posisi Column juga rata kiri
              children: [
                Text(
                  title,
                  style: AppTypography.h3,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: AppTypography.paragraph2,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
