import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Improved UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: constraints.maxHeight),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildToggleButtons(),
                                  const SizedBox(height: 20),
                                  _buildProductSection(),
                                  const SizedBox(height: 20),
                                  _buildCategorySection(),
                                  const SizedBox(height: 20),
                                  _buildExploreWellness(),
                                  // Add extra padding at the bottom to account for the navbar
                                  SizedBox(
                                      height: isExpanded.value ? 280 : 100),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: _buildExpandableNavBar(isExpanded),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Selamat Malam', style: TextStyle(color: Colors.white)),
              Text('Ahmad',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined,
                        color: Colors.white),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints:
                          const BoxConstraints(minWidth: 14, minHeight: 14),
                      child: const Text('0',
                          style: TextStyle(color: Colors.white, fontSize: 8),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('A', style: TextStyle(color: Colors.amber)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Payuung Pribadi',
                style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Payuung Karyawan',
                style: TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }

  Widget _buildProductSection() {
    final products = [
      ProductItem('Urun', Icons.group, isNew: true),
      ProductItem('Pembiayaan\nPorsi Haji', Icons.mosque),
      ProductItem('Financial\nCheck Up', Icons.list_alt),
      ProductItem('Asuransi\nMobil', Icons.directions_car),
      ProductItem('Asuransi\nProperti', Icons.home),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Produk Keuangan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) => _buildProductItem(products[index]),
        ),
      ],
    );
  }

  Widget _buildProductItem(ProductItem item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Icon(item.icon, size: 40, color: Colors.amber),
            if (item.isNew)
              Positioned(
                right: -5,
                top: -5,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('NEW',
                      style: TextStyle(color: Colors.white, fontSize: 8)),
                ),
              ),
          ],
        ),
        const SizedBox(height: 5),
        Text(item.label,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildCategorySection() {
    final categories = [
      CategoryItem('Hobi', Icons.beach_access),
      CategoryItem('Merchandise', Icons.shopping_bag),
      CategoryItem('Gaya Hidup\nSehat', Icons.favorite),
      CategoryItem('Konseling &\nRohani', Icons.chat_bubble),
      CategoryItem('Self\nDevelopment', Icons.psychology),
      CategoryItem('Perencanaan\nKeuangan', Icons.account_balance_wallet),
      CategoryItem('Konsultasi\nMedis', Icons.local_hospital),
      CategoryItem('Lihat Semua', Icons.grid_view),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Kategori Pilihan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.favorite_border, size: 16),
                  SizedBox(width: 4),
                  Text('Wishlist 0', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) =>
              _buildCategoryItem(categories[index]),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(CategoryItem item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(item.icon, size: 30, color: Colors.blue),
        ),
        const SizedBox(height: 5),
        Text(item.label,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildExploreWellness() {
    final vouchers = [
      VoucherItem(
          'Indomaret', 'Voucher Digital Indomaret Rp 25.000', 25000, null),
      VoucherItem('H&M', 'Voucher Digital H&M Rp 100.000', 100000, 3),
      VoucherItem('EXCELSO', 'Voucher Digital Excelso Rp. 50.000', 50000, 4),
      VoucherItem(
          'Bakmi GM', 'Voucher Digital Bakmi GM Rp. 100.000', 100000, 5),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Explore Wellness',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Text('Terpopuler', style: TextStyle(fontSize: 12)),
                  Icon(Icons.arrow_drop_down, size: 16),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: vouchers.length,
          itemBuilder: (context, index) => _buildVoucherItem(vouchers[index]),
        ),
      ],
    );
  }

  Widget _buildVoucherItem(VoucherItem item) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/${item.brand.toLowerCase()}_logo.png',
                height: 50),
            const SizedBox(height: 8),
            Text(item.title, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 4),
            Text('Rp ${item.price}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            if (item.discount != null) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  Text('Rp ${item.price}',
                      style: const TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough)),
                  const SizedBox(width: 4),
                  Text('${item.discount}% OFF',
                      style: const TextStyle(fontSize: 14, color: Colors.red)),
                ],
              ),
              Text('Rp ${item.price * (100 - item.discount!) ~/ 100}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableNavBar(ValueNotifier<bool> isExpanded) {
    final navItems = [
      NavBarItem(Icons.home_outlined, 'Beranda'),
      NavBarItem(Icons.search, 'Cari'),
      NavBarItem(Icons.shopping_cart_outlined, 'Keranjang', badge: '1'),
      NavBarItem(Icons.receipt_long_outlined, 'Daftar Transaksi', badge: '0'),
      NavBarItem(Icons.card_giftcard_outlined, 'Voucher Saya'),
      NavBarItem(Icons.location_on_outlined, 'Alamat Pengiriman'),
      NavBarItem(Icons.people_outline, 'Daftar Teman'),
    ];

    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! < -20) {
          isExpanded.value = true;
        } else if (details.primaryDelta! > 20) {
          isExpanded.value = false;
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isExpanded.value ? 280 : 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                isExpanded.value = !isExpanded.value;
              },
              child: SizedBox(
                height: 20,
                child: Center(
                  child: Icon(
                    isExpanded.value
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.7,
                ),
                itemCount: navItems.length,
                itemBuilder: (context, index) =>
                    _buildNavBarItem(navItems[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBarItem(NavBarItem item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Icon(item.icon, size: 24, color: Colors.grey[600]),
            if (item.badge != null)
              Positioned(
                right: -5,
                top: -5,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints:
                      const BoxConstraints(minWidth: 14, minHeight: 14),
                  child: Text(
                    item.badge!,
                    style: const TextStyle(color: Colors.white, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          item.label,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class NavBarItem {
  final IconData icon;
  final String label;
  final String? badge;

  NavBarItem(this.icon, this.label, {this.badge});
}

class ProductItem {
  final String label;
  final IconData icon;
  final bool isNew;

  ProductItem(this.label, this.icon, {this.isNew = false});
}

class CategoryItem {
  final String label;
  final IconData icon;

  CategoryItem(this.label, this.icon);
}

class VoucherItem {
  final String brand;
  final String title;
  final int price;
  final int? discount;

  VoucherItem(this.brand, this.title, this.price, this.discount);
}
