import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cmp_assignment/theme.dart';

/// ChangeNotifier to manage slot selection and subtotal visibility
class SlotProvider extends ChangeNotifier {
  int? _selectedSlotIndex;
  bool _subTotalExpanded = false;

  int? get selectedSlotIndex => _selectedSlotIndex;
  bool get subTotalExpanded => _subTotalExpanded;
  bool get subTotalVisible => _selectedSlotIndex != null;

  void selectSlot(int index) {
    if (_selectedSlotIndex == index) return;
    _selectedSlotIndex = index;
    _subTotalExpanded = true;
    notifyListeners();
  }

  void toggleSubtotal() {
    _subTotalExpanded = !_subTotalExpanded;
    notifyListeners();
  }
}



class SlideupContent extends StatelessWidget {
  const SlideupContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (ctx) {
                      return DraggableScrollableSheet(
                        initialChildSize: 0.4,
                        minChildSize: 0.2,
                        maxChildSize: 0.85,
                        expand: false,
                        builder: (ctx2, scrollController) {
                          return SlideUpContent(scrollController: scrollController);
                        },
                      );
                    },
                  );
                },
                child: const Text('Open Slots Sheet'),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SlideUpContent extends StatefulWidget {
  final ScrollController scrollController;
  const SlideUpContent({Key? key, required this.scrollController}) : super(key: key);

  @override
  State<SlideUpContent> createState() => _SlideUpContentState();
}

class _SlideUpContentState extends State<SlideUpContent> {
  bool isVeg = true;
  int selectedDateIndex = 0;
  final dates = [
    {'day': '05', 'label': 'Mon'},
    {'day': '06', 'label': 'Tue'},
    {'day': '07', 'label': 'Wed'},
    {'day': '08', 'label': 'Thu'},
    {'day': '09', 'label': 'Fri'},
    {'day': '10', 'label': 'Sat'},
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SlotProvider>();
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 16),

          // Veg / Non-Veg toggle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(child: _buildToggle('Veg items', isVeg, () => setState(() => isVeg = true))),
                const SizedBox(width: 8),
                Expanded(child: _buildToggle('Non Veg items', !isVeg, () => setState(() => isVeg = false))),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Date selector
          SizedBox(
            height: 68,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: dates.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final d = dates[i];
                final selected = i == selectedDateIndex;
                return GestureDetector(
                  onTap: () => setState(() => selectedDateIndex = i),
                  child: Container(
                    width: 56,
                    decoration: BoxDecoration(
                      color: selected ? buttonAccent : Colors.white,
                      border: Border.all(color: selected ? Colors.purple : Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(d['day']!, style: TextStyle(color: selected ? buttonSelectedText : Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(d['label']!, style: TextStyle(color: selected ? buttonSelectedText : Colors.grey.shade600)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: ListView(
              controller: widget.scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                SlotCard(icon: Icons.wb_sunny_outlined, title: 'Afternoon', subtitle: '12–02 PM', dotColor: Colors.green, slotsLeft: 4, index: 0),
                const SizedBox(height: 12),
                SlotCard(icon: Icons.nights_stay_outlined, title: 'Evening', subtitle: '07–10 PM', dotColor: Colors.amber, slotsLeft: 4, index: 1),
                const SizedBox(height: 24),

                if (provider.subTotalVisible) ...[
                  GestureDetector(
                    onTap: provider.toggleSubtotal,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
                      child: Row(children: [const Expanded(child: Text('Sub total  ₹30,000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))), Icon(provider.subTotalExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down)]),
                    ),
                  ),
                  if (provider.subTotalExpanded) ...[
                    const SizedBox(height: 12),
                    _buildDetailRow('Plate price', '₹300'),
                    _buildDetailRow('No. of guests', '100'),
                    _buildDashedDivider(),
                    _buildDetailRowBold('Sub total', '₹30,000'),
                  ],
                ],
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(onPressed: provider.subTotalVisible ? () {} : null, style: ElevatedButton.styleFrom(backgroundColor: brandMain, disabledBackgroundColor: Colors.purple.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Next', style: TextStyle(fontSize: 16,color: Colors.white))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggle(String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(color: selected ? Colors.white : Colors.grey.shade200, borderRadius: BorderRadius.circular(20), boxShadow: selected ? [BoxShadow(color: Colors.black12, blurRadius: 4)] : null),
        child: Center(child: Text(label, style: TextStyle(color: selected ? Colors.black : Colors.grey.shade600))),
      ),
    );
  }
}

class SlotCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color dotColor;
  final int slotsLeft;
  final int index;

  const SlotCard({Key? key, required this.icon, required this.title, required this.subtitle, required this.dotColor, required this.slotsLeft, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SlotProvider>();
    final selected = provider.selectedSlotIndex == index;
    final borderColor = selected ? Colors.purple : Colors.grey.shade300;
    final background = selected ? Colors.purple.shade50 : Colors.white;

    return Material(
      color: background,
      shape: RoundedRectangleBorder(side: BorderSide(color: borderColor, width: 2), borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => provider.selectSlot(index),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(icon, size: 28, color: Colors.black87),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)), const SizedBox(height: 2), Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 13))])),
              Row(children: [Container(width: 8, height: 8, decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle)), const SizedBox(width: 6), Text('$slotsLeft slots left', style: TextStyle(color: Colors.grey.shade700))]),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDetailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        Expanded(child: Text(label, style: const TextStyle(fontSize: 14))),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    ),
  );
}

Widget _buildDetailRowBold(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        Expanded(child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Widget _buildDashedDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: LayoutBuilder(builder: (context, constraints) {
      final dashWidth = 6.0;
      final dashCount = (constraints.maxWidth / (2 * dashWidth)).floor();
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(dashCount, (_) => SizedBox(width: dashWidth, height: 1, child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey.shade300)))),
      );
    }),
  );
}
