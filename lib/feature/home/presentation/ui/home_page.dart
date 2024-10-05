import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:payuung_clone/feature/home/presentation/widget/home_category_view.dart';
import 'package:payuung_clone/feature/home/presentation/widget/home_expandable_navbar_view.dart';
import 'package:payuung_clone/feature/home/presentation/widget/home_explore_wellnes_view.dart';
import 'package:payuung_clone/feature/home/presentation/widget/home_header_view.dart';
import 'package:payuung_clone/feature/home/presentation/widget/home_product_view.dart';
import 'package:payuung_clone/feature/home/presentation/widget/home_toggle_buttons_view.dart';

@RoutePage()
class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeaderView(),
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
                                  const HomeToggleButtonsView(),
                                  const SizedBox(height: 20),
                                  const HomeProductView(),
                                  const SizedBox(height: 20),
                                  const HomeCategoryView(),
                                  const SizedBox(height: 20),
                                  const HomeExploreWellnesView(),
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
                        child: HomeExpandableNavbarView(
                          isExpanded: isExpanded,
                        ),
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
}
