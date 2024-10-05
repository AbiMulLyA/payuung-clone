import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:payuung_clone/core/config/router/router.dart';

class HomeHeaderView extends StatelessWidget {
  const HomeHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
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
              GestureDetector(
                onTap: () {
                  context.pushRoute(const ProfileRoute());
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('A', style: TextStyle(color: Colors.amber)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
