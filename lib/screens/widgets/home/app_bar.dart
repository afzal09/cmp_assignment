import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cmp_assignment/screens/widgets/home/category_Tab.dart';
import 'package:cmp_assignment/screens/quoatation_generated.dart';

class appBar extends StatelessWidget {
  const appBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Transform.rotate(
                angle: -100, // ~ -100°
                child: const Icon(Icons.navigation, color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Text("Hyderabad",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    const Icon(Icons.headphones_outlined, color: Colors.white),
              )
            ],
          ),
        ),

        // Category tabs
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: const [
              CategoryTab(label: "All", selected: true),
              CategoryTab(label: "Delivery Box"),
              CategoryTab(label: "Catering"),
              CategoryTab(label: "Meal Box"),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Banner
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Text(
                "Exclusive",
                style: GoogleFonts.playfairDisplay(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
              Text(
                "Delivery Box",
                style: GoogleFonts.playfairDisplay(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SuggestedPlattersScreen(),
                    ),
                  );
                },
                child: const Text(
                  "ORDER NOW",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}