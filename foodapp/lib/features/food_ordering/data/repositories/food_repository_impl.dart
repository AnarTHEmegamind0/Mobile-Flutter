import 'package:flutter/material.dart';
import '../../domain/repositories/food_repository.dart';
import '../models/item_model.dart';
import '../models/customer_model.dart';
import '../../../authentication/data/models/user_model.dart';

class FoodRepositoryImpl implements FoodRepository {
  @override
  List<ItemModel> getMenuItems() {
    return [
      ItemModel(
        name: 'Бууз',
        totalPriceCents: 150000, // 1500₮
        uid: '1',
        imageProvider: const NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Buuz_from_UB.jpg/1200px-Buuz_from_UB.jpg'),
        description: 'Монгол үндэсны хоол',
      ),
      ItemModel(
        name: 'Хуушуур',
        totalPriceCents: 200000, // 2000₮
        uid: '2',
        imageProvider: const NetworkImage('https://mongoliacuisine.com/wp-content/uploads/2020/05/khuushuur.jpg'),
        description: 'Уламжлалт хуушуур',
      ),
      ItemModel(
        name: 'Цуйван',
        totalPriceCents: 900000, // 9000₮
        uid: '3',
        imageProvider: const NetworkImage('https://www.internationalcuisine.com/wp-content/uploads/2018/01/tsuivan-684x1024.jpg'),
        description: 'Гүзээний мах, гурилан гоймонтой хоол',
      ),
      ItemModel(
        name: 'Банштай цай',
        totalPriceCents: 750000, // 7500₮
        uid: '4',
        imageProvider: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRClgDVBO_XLRjnf7lzjlTUdQhdhCyqO-8kZw&usqp=CAU'),
        description: 'Махтай банш цайтай',
      ),
      ItemModel(
        name: 'Шөл',
        totalPriceCents: 650000, // 6500₮
        uid: '5',
        imageProvider: const NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Mongolian_suutei_tsai.jpg/1200px-Mongolian_suutei_tsai.jpg'),
        description: 'Махтай ногоотой шөл',
      ),
      ItemModel(
        name: 'Будаатай хуурга',
        totalPriceCents: 1100000, // 11000₮
        uid: '6',
        imageProvider: const NetworkImage('https://theecology.net/wp-content/uploads/2023/03/mongolian-food.jpg'),
        description: 'Тахианы махтай будаа',
      ),
      ItemModel(
        name: 'Тахианы шарсан мах',
        totalPriceCents: 1500000, // 15000₮
        uid: '7',
        imageProvider: const NetworkImage('https://www.tastingtable.com/img/gallery/20-mongolian-foods-you-need-to-try-at-least-once/intro-1667425841.jpg'),
        description: 'Тахианы шарсан мах хүнсний ногоотой',
      ),
    ];
  }

  @override
  CustomerModel createCustomerFromUser(UserModel user) {
    return CustomerModel(
      name: user.name,
      imageProvider: user.imageProvider,
    );
  }
}