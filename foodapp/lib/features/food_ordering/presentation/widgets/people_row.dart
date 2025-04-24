import 'package:flutter/material.dart';
import '../../data/models/customer_model.dart';
import '../../data/models/item_model.dart';
import 'customer_cart.dart';

class PeopleRow extends StatelessWidget {
  const PeopleRow({
    super.key,
    required this.customers,
    required this.onItemDropped,
  });

  final List<CustomerModel> customers;
  final Function({required ItemModel item, required CustomerModel customer})
  onItemDropped;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Row(
        children:
            customers
                .map((customer) => _buildPersonWithDropZone(customer))
                .toList(),
      ),
    );
  }

  Widget _buildPersonWithDropZone(CustomerModel customer) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: DragTarget<ItemModel>(
          builder: (context, candidateItems, rejectedItems) {
            return CustomerCart(
              hasItems: customer.items.isNotEmpty,
              highlighted: candidateItems.isNotEmpty,
              customer: customer,
            );
          },
          onAcceptWithDetails: (details) {
            onItemDropped(item: details.data, customer: customer);
          },
        ),
      ),
    );
  }
}
