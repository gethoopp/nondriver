import 'package:ondriver/model/chinnese_food_list.dart';

abstract class ChineseeFoodRepository {
  Future<List<ChinneseFoodList>> getChineseeFood();
}
