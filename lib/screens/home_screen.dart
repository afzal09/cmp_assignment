

import 'package:flutter/material.dart';
import 'package:cmp_assignment/theme.dart';
import 'package:cmp_assignment/screens/widgets/home/app_Bar.dart';
import 'package:cmp_assignment/screens/widgets/home/product_grid.dart';
import 'package:cmp_assignment/screens/widgets/home/platter_card.dart';
import 'package:cmp_assignment/screens/widgets/home/feature_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brandMain,
      body: SafeArea(
        child: Column(
          children: [
            appBar(),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16, bottom: 24),
                  child: Column(
                    children: const [
                      ProductGrid(),
                      SizedBox(height: 16),
                      FeatureRow(),
                      SizedBox(height: 24),
                      PlatterCard(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





