import 'package:flutter/material.dart';
import '../../data/models/item_model.dart';
import 'menu_list_item.dart';
import 'dragging_list_item.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
    required this.menuItems,
    required this.draggableKey,
  });

  final List<ItemModel> menuItems;
  final GlobalKey draggableKey;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: menuItems.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return _buildMenuItem(item: item);
      },
    );
  }

  Widget _buildMenuItem({required ItemModel item}) {
    return LongPressDraggable<ItemModel>(
      data: item,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingListItem(
        dragKey: draggableKey,
        photoProvider: item.imageProvider,
      ),
      child: MenuListItem(
        name: item.name,
        price: item.formattedTotalItemPrice,
        description: item.description,
        photoProvider: item.imageProvider,
      ),
    );
  }
}
