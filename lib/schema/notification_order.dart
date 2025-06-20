import 'package:isar/isar.dart';

part 'notification_order.g.dart';

@collection
class NotifcaitonOrderStatus {
  Id id = Isar.autoIncrement;
  late String title;
  late double price;
  late int quantity;
  late bool statusOrder;
}
