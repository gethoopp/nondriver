import 'package:isar/isar.dart';

part 'delivery_status.g.dart';

@collection
class DeliveryStatus {
  late Id id;
  late String title;
  late int price;
  late String image;
  late bool statusDeliv;
  late int quantity;

  late double userLat;
  late double userLong;
}
