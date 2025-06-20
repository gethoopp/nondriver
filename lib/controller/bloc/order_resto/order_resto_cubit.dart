import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ondriver/controller/isar_controller/add_item.dart';
import 'package:ondriver/schema/order_status.dart';

part 'order_resto_state.dart';

class OrderRestoCubit extends Cubit<OrderRestoState> {
  final IsarService isarService;
  OrderRestoCubit(this.isarService) : super(OrderRestoLoaded());

  Future<void> getAllDataOrder() async {
    try {
      final result = await isarService.getActiveRestoOrders();
      emit(OrderRestoSucces(result));
    } catch (e) {
      emit(OrderRestoError(e.toString()));
    }
  }
}
