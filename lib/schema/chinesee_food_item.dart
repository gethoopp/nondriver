import 'package:isar/isar.dart';

part 'chinesee_food_item.g.dart';

@collection
class ChineseeFoodItem {
  late Id id;
  late String title;
  late double price;
  late int quantity;
  late double userLat;
  late double userLong;
}
