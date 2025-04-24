import 'package:flutter/material.dart';
import '../widgets/order_item_list.dart';
import '../../data/repositories/food_repository_impl.dart';
import '../../../authentication/data/repositories/auth_repository_impl.dart';
import '../controllers/food_ordering_controller.dart';
import '../../../../core/utils/navigation_helper.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({super.key});

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  late FoodOrderingController _controller;
  final _authRepo = AuthRepositoryImpl();

  @override
  void initState() {
    super.initState();
    final currentUser = _authRepo.getCurrentUser();
    if (currentUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        NavigationHelper.goBack(context);
      });
      return;
    }

    _controller = FoodOrderingController(FoodRepositoryImpl(), currentUser);
  }

  void _confirmOrder() {
    final items = _controller.customer.items;
    if (items.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Таны сагс хоосон байна')));
      return;
    }

    // Create order summary text
    final orderSummary = items
        .map((item) => "${item.name}: ${item.formattedTotalItemPrice}")
        .join("\n");
    final totalAmount = _controller.customer.formattedTotalItemPrice;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Захиалга амжилттай!\n$orderSummary\nНийт: $totalAmount'),
        duration: const Duration(seconds: 4),
      ),
    );

    // Clear cart after order is confirmed
    _controller.clearCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Захиалга баталгаажуулах')),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return Column(
            children: [
              Expanded(
                child: OrderItemList(
                  items: _controller.customer.items,
                  onRemove: _controller.removeItemFromCart,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Нийт дүн: ${_controller.customer.formattedTotalItemPrice}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _confirmOrder,
                      child: const Text('Захиалга баталгаажуулах'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
