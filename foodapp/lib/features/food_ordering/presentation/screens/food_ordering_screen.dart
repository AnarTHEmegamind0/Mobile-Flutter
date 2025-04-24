import 'package:flutter/material.dart';
import '../controllers/food_ordering_controller.dart';
import '../widgets/menu_list.dart';
import '../widgets/customer_cart.dart';
import '../../data/repositories/food_repository_impl.dart';
import '../../../authentication/data/repositories/auth_repository_impl.dart';
import '../../../../routes.dart';
import '../../../../core/utils/navigation_helper.dart';
import '../../../../core/constants/color_constants.dart';

class FoodOrderingScreen extends StatefulWidget {
  const FoodOrderingScreen({super.key});

  @override
  State<FoodOrderingScreen> createState() => _FoodOrderingScreenState();
}

class _FoodOrderingScreenState extends State<FoodOrderingScreen> {
  late FoodOrderingController _controller;
  final _authRepo = AuthRepositoryImpl();

  @override
  void initState() {
    super.initState();
    final currentUser = _authRepo.getCurrentUser();
    if (currentUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        NavigationHelper.navigateToAndReplace(context, AppRoutes.login);
      });
      return;
    }
    
    _controller = FoodOrderingController(
      FoodRepositoryImpl(), 
      currentUser,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.scaffoldBackground,
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Хоол захиалах'),
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: MenuList(
                  menuItems: _controller.menuItems,
                  draggableKey: _controller.draggableKey,
                ),
              ),
              _buildCustomerSection(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: DragTarget<ItemModel>(
                builder: (context, candidateItems, rejectedItems) {
                  return GestureDetector(
                    onTap: () {
                      if (_controller.customer.items.isNotEmpty) {
                        NavigationHelper.navigateTo(
                          context, 
                          AppRoutes.orderConfirmation,
                        );
                      }
                    },
                    child: ListenableBuilder(
                      listenable: _controller,
                      builder: (context, _) {
                        return CustomerCart(
                          hasItems: _controller.customer.items.isNotEmpty,
                          highlighted: candidateItems.isNotEmpty,
                          customer: _controller.customer,
                        );
                      },
                    ),
                  );
                },
                onAcceptWithDetails: (details) {
                  _controller.addItemToCustomerCart(details.data);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}