import 'package:dio/dio.dart';
import 'package:ondriver/controller/repository/chinesse_food_repository/chinesee_food_repository.dart';
import 'package:ondriver/model/chinnese_food_list.dart';

class GetListFood implements ChineseeFoodRepository {
  final dio = Dio();
  @override
  Future<ChinneseFoodList> getChineseeFood() async {
    try {
      final result = await dio.get(
        'https://chinese-food-db.p.rapidapi.com/',
        options: Options(
          headers: {
            'x-rapidapi-host': 'chinese-food-db.p.rapidapi.com',
            'x-rapidapi-key':
                '1510cb8b3fmshaab350a19adcb78p13844djsne0fbaa11ad2e',
          },
        ),
      );
      if (result.statusCode == 200) {
        return ChinneseFoodList.fromJson(result.data);
      } else if (result.statusCode! >= 500) {
        throw Exception('Gagal, Cek koneksi anda!!!');
      }
    } catch (e) {
      return throw Exception(
        'Terjadi kesalahan saat mengambil data: ${e.toString()}',
      );
    }
    throw Exception('Tidak dapat mengambil data makanan China.');
  }
}
