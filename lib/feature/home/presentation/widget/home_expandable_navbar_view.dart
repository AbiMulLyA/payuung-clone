import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../main.dart';

class HomeExpandableNavbarView extends HookWidget {
  const HomeExpandableNavbarView({
    super.key,
    required this.isExpanded,
  });
  final ValueNotifier<bool> isExpanded;

  @override
  Widget build(BuildContext context) {
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
                  itemBuilder: (context, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Icon(navItems[index].icon,
                                  size: 24, color: Colors.grey[600]),
                              if (navItems[index].badge != null)
                                Positioned(
                                  right: -5,
                                  top: -5,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    constraints: const BoxConstraints(
                                        minWidth: 14, minHeight: 14),
                                    child: Text(
                                      navItems[index].badge!,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 8),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            navItems[index].label,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[600]),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarItem {
  final IconData icon;
  final String label;
  final String? badge;

  NavBarItem(this.icon, this.label, {this.badge});
}
