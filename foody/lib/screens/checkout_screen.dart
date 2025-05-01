import 'package:flutter/material.dart';
import 'package:foody/models/customer.dart';
import 'package:foody/models/item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foody/constants.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.customer});

  final Customer customer;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Map<String, List<Item>> _groupItemsByName(List<Item> items) {
    final Map<String, List<Item>> groupedItems = {};
    for (var item in items) {
      groupedItems.putIfAbsent(item.name, () => []).add(item);
    }
    return groupedItems;
  }

  List<Item> get items => widget.customer.items;

  void _handleCheckout() {
    final orderedItems = items.map((item) => item.name).join(', ');
    final totalPrice = _formattedTotalItemPrice();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Order placed for: $orderedItems\nTotal: $totalPrice'),
      ),
    );

    // Add your payment logic here
  }

  String _formattedTotalItemPrice() {
    final totalPriceCents = items.fold<int>(
      0,
      (sum, item) => sum + item.totalPriceCents,
    );
    return '\$${(totalPriceCents / 100).toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    final groupedItems = _groupItemsByName(items);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: GoogleFonts.limelight(
            textStyle: const TextStyle(
              fontSize: 32,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: items.isEmpty
                ? const Center(
                    child: Text(
                      'No items in the cart.',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: groupedItems.length,
                    itemBuilder: (context, index) {
                      final itemName = groupedItems.keys.elementAt(index);
                      final itemList = groupedItems[itemName]!;
                      final item = itemList.first;
                      final quantity = itemList.length;
                      final totalPriceCents = item.totalPriceCents * quantity;
                      return Dismissible(
                        key: Key(item.uid + quantity.toString()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            items.removeWhere((element) => element.name == itemName);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$itemName removed')),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                image: item.imageProvider,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              itemName,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              quantity > 1
                                  ? '\$${(item.totalPriceCents / 100).toStringAsFixed(2)} × $quantity = \$${(totalPriceCents / 100).toStringAsFixed(2)}'
                                  : '\$${(item.totalPriceCents / 100).toStringAsFixed(2)}',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: ElevatedButton(
              onPressed: items.isEmpty ? null : _handleCheckout,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: kPrimaryColor,
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Total: ${_formattedTotalItemPrice()}',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
