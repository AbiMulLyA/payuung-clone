import 'package:flutter/material.dart';

import '../../../../main.dart';

class HomeProductView extends StatelessWidget {
  const HomeProductView({super.key});

  @override
  Widget build(BuildContext context) {
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
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Icon(products[index].icon, size: 40, color: Colors.amber),
                  if (products[index].isNew)
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
              Text(products[index].label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductItem {
  final String label;
  final IconData icon;
  final bool isNew;

  ProductItem(this.label, this.icon, {this.isNew = false});
}
