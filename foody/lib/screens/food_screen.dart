import 'package:flutter/material.dart';
import '../models/item.dart';
import '../models/customer.dart';
import '../data/item_data.dart';
import '../widgets/customer_cart.dart';
import '../widgets/dragging_list_item.dart';
import '../widgets/menu_list_item.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class FoodScreen extends StatefulWidget {
  //newtersen hereglegchiig props damjuulan awaad
  // ignore: non_constant_identifier_names
  final Customer auth_hereglegch;

  // ignore: non_constant_identifier_names
  const FoodScreen({super.key, required this.auth_hereglegch});

  
  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> with TickerProviderStateMixin {
  final GlobalKey _draggableKey = GlobalKey();

  void _itemDroppedOnCustomerCart({
    required Item item,
    required Customer customer,
  }) {
    setState(() {
      customer.items.add(item);
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildContent());
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(
        'Order',
        style: GoogleFonts.limelight(
          textStyle: TextStyle(
            fontSize: 32,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [Expanded(child: _buildMenuList()), _buildPeopleRow()],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildMenuItem(item: item);
      },
    );
  }

  Widget _buildMenuItem({required Item item}) {
    return LongPressDraggable<Item>(
      data: item,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingListItem(
        dragKey: _draggableKey,
        photoProvider: item.imageProvider,
      ),
      child: MenuListItem(
        name: item.name,
        price: item.formattedTotalItemPrice,
        photoProvider: item.imageProvider,
      ),
    );
  }

  // Widget _buildPeopleRow() {
  //   return Container(
  //     height: 200, // Заавал өндөр өгнө, ListView хэвтээ үед өндөр мэдэх хэрэгтэй
  //     padding: const EdgeInsets.symmetric(horizontal: 8),
  //     child: ListView.separated(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: people.length,
  //       separatorBuilder: (context, index) => const SizedBox(width: 12),
  //       itemBuilder: (context, index) {
  //         final customer = people[index];
  //         return SizedBox(
  //           width: 160, // Хэрэглэгч картын өргөн
  //           child: _buildPersonWithDropZone(customer),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildPeopleRow() {
    final customer = widget.auth_hereglegch;
    return Material(
      child: Card(
        elevation: 0,
        child: _buildPersonWithDropZone(customer),
      ),
    );
  }


  Widget _buildPersonWithDropZone(Customer customer) {
    return DragTarget<Item>(
      builder: (context, candidateItems, rejectedItems) {
        return CustomerCart(
          hasItems: customer.items.isNotEmpty,
          highlighted: candidateItems.isNotEmpty,
          customer: customer,
        );
      },
      onAcceptWithDetails: (details) {
        _itemDroppedOnCustomerCart(item: details.data, customer: customer);
      },
    );
  }
}
