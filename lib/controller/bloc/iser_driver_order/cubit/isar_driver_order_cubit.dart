import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ondriver/controller/isar_controller/add_item.dart';
import 'package:ondriver/schema/delivery_status.dart';
import 'package:ondriver/schema/notification_order.dart';

part 'isar_driver_order_state.dart';

class IsarDriverOrderCubit extends Cubit<IsarDriverOrderState> {
  final IsarService isarService;
  IsarDriverOrderCubit(this.isarService) : super(IsarDriverOrderLoaded());

  Future<void> getActiveOrder() async {
    try {
      final result = await isarService.getDataOrderDelivery();
      emit(IsarDriverOrderSucces(result));
    } catch (e) {
      emit(IsarDriverOrderError(e.toString()));
    }
  }
}
