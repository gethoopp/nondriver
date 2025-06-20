import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ondriver/controller/isar_controller/add_item.dart';
import 'package:ondriver/schema/chinesee_food_item.dart';

part 'order_data_state.dart';

class OrderDataCubit extends Cubit<OrderDataState> {
  final IsarService isarService;
  OrderDataCubit(this.isarService) : super(OrderDataLoaded());

  Future<void> getDataOrder() async {
    try {
      final result = await isarService.getDataOrder();
      emit(OrderDataSucces(result));
    } catch (e) {
      emit(OrderDataError(e.toString()));
    }
  }
}
