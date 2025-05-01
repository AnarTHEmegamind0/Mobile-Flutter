import 'package:flutter/material.dart';
import 'package:foody/screens/checkout_screen.dart';
import '../models/customer.dart';

class CustomerCart extends StatelessWidget {
  const CustomerCart({
    super.key,
    required this.customer,
    this.highlighted = false,
    this.hasItems = false,
  });

  final Customer customer;
  final bool highlighted;
  final bool hasItems;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        highlighted ? const Color.fromARGB(255, 104, 9, 246) : Colors.white;
    final Color textColor = highlighted ? Colors.white : Colors.black;

    void _gotoCheckout() {
      if (hasItems) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CheckoutScreen(customer: customer))
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No items in cart'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }

    return ElevatedButton(
      onPressed: _gotoCheckout,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: customer.imageProvider, radius: 23),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                customer.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (hasItems) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    customer.formattedTotalItemPrice,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${customer.items.length} item${customer.items.length != 1 ? 's' : ''}',
                    style: TextStyle(
                      color: textColor.withOpacity(0.85),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
