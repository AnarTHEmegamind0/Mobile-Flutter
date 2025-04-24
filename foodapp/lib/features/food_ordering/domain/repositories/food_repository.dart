import '../../data/models/item_model.dart';
import '../../data/models/customer_model.dart';
import '../../../authentication/data/models/user_model.dart';

abstract class FoodRepository {
  List<ItemModel> getMenuItems();
  CustomerModel createCustomerFromUser(UserModel user);
}