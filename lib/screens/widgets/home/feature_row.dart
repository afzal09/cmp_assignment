import 'package:flutter/material.dart';
import 'package:cmp_assignment/screens/widgets/home/feature_card.dart';

class FeatureRow extends StatelessWidget {
  const FeatureRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: const [
          Expanded(
            child: FeatureCard(
              title: "Find My\nPlatter",
              imagePath: 'assets/magnifying_glass.png',
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: FeatureCard(
              title: "Create\nmenu",
              imagePath: 'assets/chef_hat.png',
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: FeatureCard(
              title: "Discounted\nPlatters",
              imagePath: 'assets/discount_tag.png',
            ),
          ),
        ],
      ),
    );
  }
}