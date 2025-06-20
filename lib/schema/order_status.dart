import 'package:isar/isar.dart';

part 'order_status.g.dart';

@collection
class OrderStatus {
  Id id = Isar.autoIncrement;
  late String title;
  late double price;
  late int quantity;
  late bool statusOrder;

  late double userLat;
  late double userLong;
}
