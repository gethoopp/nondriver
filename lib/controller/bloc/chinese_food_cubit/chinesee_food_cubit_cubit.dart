import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ondriver/controller/repository/chinesse_food_repository/chinesee_food_repository.dart';
import 'package:ondriver/model/chinnese_food_list.dart';

part 'chinesee_food_cubit_state.dart';

class ChineseeFoodCubitCubit extends Cubit<ChineseeFoodCubitState> {
  final ChineseeFoodRepository chineseeFoodRepository;
  ChineseeFoodCubitCubit(this.chineseeFoodRepository)
    : super(ChineseeFoodCubitLoaded());

  Future<List<ChinneseFoodList>> getListChineseFood() async {
    try {
      final result = await chineseeFoodRepository.getChineseeFood();

      emit(ChineseeFoodCubitSuccesState(result));
      return result;
    } catch (e) {
      emit(ChineseeFoodErrorState(e.toString()));
      throw Exception(e.toString());
    }
  }
}
