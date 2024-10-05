import 'package:flutter/material.dart';

import '../../../../main.dart';

class HomeCategoryView extends StatelessWidget {
  const HomeCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
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
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    Icon(categories[index].icon, size: 30, color: Colors.blue),
              ),
              const SizedBox(height: 5),
              Text(categories[index].label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
class CategoryItem {
  final String label;
  final IconData icon;

  CategoryItem(this.label, this.icon);
}