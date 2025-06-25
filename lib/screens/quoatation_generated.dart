import 'package:flutter/material.dart';

import 'package:cmp_assignment/screens/widgets/quoatation_denerated/slideup_content.dart';

class SuggestedPlattersScreen extends StatelessWidget {
  const SuggestedPlattersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suggested Platters"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading:  BackButton(onPressed:(){Navigator.pop(context);}),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _quotationCard(),
            const SizedBox(height: 12),
            _platterCard(),
            const SizedBox(height: 16),
            _tryBeforeYouDecide(),
            const SizedBox(height: 16),
            const Text(
              "Experience our services",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _experienceCarousel(),
            const SizedBox(height: 16),
            _customiseCard(),
            const SizedBox(height: 16),
            const Text(
              "Hear from our customers",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _customerReviews(),
            const SizedBox(height: 16),
            _shareOpinionCard(),
            const SizedBox(height: 24),
            _footerButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _quotationCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFDFF5E1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.check_circle, color: Colors.green, size: 28),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Quotation generated",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("We have curated a quotation for you",
                    style: TextStyle(color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _platterCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/platter.png",
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Abhi’s Birthday Platter",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(height: 4),
                    Text("View Menu",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Event\nBirthday"),
              Text("Guest count\n120 (30 Veg)"),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Date\n05/06/2025"),
              Text("Time\n06:30PM"),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "Price  ₹30,000",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text("Excluding delivery charges and taxes",
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _tryBeforeYouDecide() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF470063),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Try Before You Decide",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                const Text("Flavour test before you finalise the booking.",
                    style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black),
                  child: const Text("Book now"),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Image.asset("assets/tasting.png",
              width: 80, fit: BoxFit.cover),
        ],
      ),
    );
  }

  Widget _experienceCarousel() {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _experienceCard("Birthday party", "Delivery Box"),
          _experienceCard("Kitty party", "Value Catering"),
          _experienceCard("Birthday party", "Delivery Box"),
        ],
      ),
    );
  }

  Widget _experienceCard(String title, String subtitle) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset("assets/party.png",
                  fit: BoxFit.cover, width: 120),
            ),
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(subtitle, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _customiseCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 236, 236, 236),
        boxShadow: [BoxShadow(color: Colors.black)]
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Chip(
                  label: Text("Exclusive consultation"),
                  backgroundColor: Color(0xFFDFF5E1),
                  labelStyle: TextStyle(fontSize: 10, color: Colors.black),
                ),
                const SizedBox(height: 8),
                const Text("Customise with an expert\non call",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white),
                  child: const Text("Book now"),
                ),
              ],
            ),
          ),
          //const SizedBox(width: 12),
          Image.asset("assets/expert.png", width: 20 * 10,height: 25 * 10,fit: BoxFit.cover,),
        ],
      ),
    );
  }

  Widget _customerReviews() {
    return Row(
      children: [
        _reviewTile("Abhinav C", 5.0),
        const SizedBox(width: 8),
        _reviewTile("Jasmine T", 4.8),
      ],
    );
  }

  Widget _reviewTile(String name, double rating) {
    return Expanded(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset("assets/customer.png",
                height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
          const Text("Delivery Box", style: TextStyle(fontSize: 12)),
          Text("⭐ $rating", style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _shareOpinionCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD9F8E2),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Get the gang’s opinion!",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                const Text("Share the menu link with your fam or friends & decide"),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  label: const Text("Share"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Image.asset("assets/group.png", width: 16 * 10,height: 18 * 10,fit: BoxFit.cover,),
        ],
      ),
    );
  }

  Widget _footerButtons(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {Navigator.pop(context);},
          child: const Text("Cancel", style: TextStyle(color: Colors.red)),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.purple,
                  side: const BorderSide(color: Colors.purple),
                ),
                child: const Text("Save for later"),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // allow full-screen drag
                    backgroundColor:
                        Colors.transparent, // so rounded corners show
                    builder: (_) =>_buildDraggableSlotsSheet(),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white),
                child: const Text("Proceed"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// 2) The draggable sheet itself:
// 2) The draggable sheet with your two slot cards
Widget _buildDraggableSlotsSheet() {
  return DraggableScrollableSheet(
    initialChildSize: 0.4,
    minChildSize: 0.2,
    maxChildSize: 0.85,
    expand: false,
    builder: (context, scrollController) {
      return SlideUpContent(scrollController: scrollController);
    },
  );
}

