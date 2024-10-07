import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../main.dart';

class HomeExploreWellnesView extends StatelessWidget {
  const HomeExploreWellnesView({super.key});

  @override
  Widget build(BuildContext context) {
    final vouchers = [
      VoucherItem('assets/image/voucher_1.svg', 'Indomaret',
          'Voucher Digital Indomaret Rp 25.000', 25000, null),
      VoucherItem('assets/image/voucher_2.svg', 'H&M',
          'Voucher Digital H&M Rp 100.000', 100000, 3),
      VoucherItem('assets/image/voucher_3.svg', 'EXCELSO',
          'Voucher Digital Excelso Rp. 50.000', 50000, 4),
      VoucherItem('assets/image/voucher_4.svg', 'Bakmi GM',
          'Voucher Digital Bakmi GM Rp. 100.000', 100000, 5),
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
          itemBuilder: (context, index) => Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(vouchers[index].imagePath, height: 50),
                  const SizedBox(height: 8),
                  Text(vouchers[index].title,
                      style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 4),
                  Text('Rp ${vouchers[index].price}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  if (vouchers[index].discount != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text('Rp ${vouchers[index].price}',
                            style: const TextStyle(
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough)),
                        const SizedBox(width: 4),
                        Text('${vouchers[index].discount}% OFF',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.red)),
                      ],
                    ),
                    Text(
                        'Rp ${vouchers[index].price * (100 - vouchers[index].discount!) ~/ 100}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class VoucherItem {
  final String imagePath;
  final String brand;
  final String title;
  final int price;
  final int? discount;

  VoucherItem(
      this.imagePath, this.brand, this.title, this.price, this.discount);
}
