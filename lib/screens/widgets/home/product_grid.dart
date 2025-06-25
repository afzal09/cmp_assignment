import 'package:flutter/material.dart';
import 'package:cmp_assignment/screens/widgets/home/menu_Card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.05,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          MenuCard(
            title: 'Delivery Box',
            subtitle: '10 - 150 guests',
            imagePath: 'assets/delivery_box.png',
          ),
          MenuCard(
            title: 'Meal Box',
            subtitle: '10 to 1500+ guests',
            imagePath: 'assets/meal_box.png',
          ),
          MenuCard(
            title: 'Catering',
            subtitle: '10 to 1500+ guests',
            imagePath: 'assets/catering.png',
            badgeText: 'Exclusive',
          ),
        ],
      ),
    );
  }
}