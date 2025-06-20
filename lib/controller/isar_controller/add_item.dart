import 'package:isar/isar.dart';
import 'package:ondriver/schema/chinesee_food_item.dart';
import 'package:ondriver/schema/delivery_status.dart';
import 'package:ondriver/schema/notification_order.dart';
import 'package:ondriver/schema/order_status.dart';
import 'package:path_provider/path_provider.dart';
// Ganti dengan path model milikmu

class IsarService {
  static late Isar _isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([
      NotifcaitonOrderStatusSchema,
      OrderStatusSchema,
      ChineseeFoodItemSchema,
      DeliveryStatusSchema,
      // Tambahkan semua schema model kamu di sini
    ], directory: dir.path);
  }

  static Isar get instance => _isar;

  Future<void> saveNotifIfNotExists(NotifcaitonOrderStatus item) async {
    final existing = await _isar.notifcaitonOrderStatus.get(item.id);
    if (existing == null) {
      await _isar.writeTxn(() async {
        await _isar.notifcaitonOrderStatus.put(item);
      });
    }
  }

  Future<List<ChineseeFoodItem>> getDataOrder() async {
    return await _isar.chineseeFoodItems.where().findAll();
  }

  Future<List<DeliveryStatus>> getDataOrderDelivery() async {
    return await _isar.deliveryStatus.where().findAll();
  }

  Future<void> sendDataOrder(ChineseeFoodItem item) async {
    final exist = await _isar.chineseeFoodItems.get(item.id);

    await _isar.writeTxn(() async {
      if (exist != null) {
        exist.quantity += item.quantity;
        exist.price += item.price;
        await _isar.chineseeFoodItems.put(exist);
      } else {
        await _isar.chineseeFoodItems.put(item);
      }
    });
  }

  Future<void> sendDataDriver(DeliveryStatus item) async {
    final existing = await _isar.deliveryStatus.get(item.id);
    if (existing == null) {
      await _isar.writeTxn(() async {
        await _isar.deliveryStatus.put(item);
      });
    }
  }

  Future<void> sendActiveOrder(OrderStatus item) async {
    final existing = await _isar.orderStatus.get(item.id);
    if (existing == null) {
      await _isar.writeTxn(() async {
        await _isar.orderStatus.put(item);
      });
    }
  }

  Future<List<NotifcaitonOrderStatus>> getActiveOrders() async {
    return await _isar.notifcaitonOrderStatus
        .filter()
        .statusOrderEqualTo(true)
        .findAll();
  }

  Future<List<OrderStatus>> getActiveRestoOrders() async {
    return await _isar.orderStatus.filter().statusOrderEqualTo(true).findAll();
  }

  // Future<List<NotifcaitonOrderStatus>> getActiveOrders() async {
  //   return await _isar.notifcaitonOrderStatus
  //       .filter()
  //       .statusOrderEqualTo(true)
  //       .findAll();
  // }

  //Section clear Data
  Future<void> clearAllNotifOrders() async {
    await _isar.writeTxn(() async {
      await _isar.notifcaitonOrderStatus.clear();
    });
  }

  Future<void> deleterDataOrderByid(int id) async {
    await _isar.writeTxn(() async {
      await _isar.orderStatus.delete(id);
    });
  }

  Future<void> clearAllOrderSuccesData() async {
    await _isar.writeTxn(() async {
      await _isar.chineseeFoodItems.clear();
    });
  }
}
