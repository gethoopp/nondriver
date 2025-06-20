import 'package:dio/dio.dart';
import 'package:ondriver/controller/repository/chinesse_food_repository/chinesee_food_repository.dart';
import 'package:ondriver/model/chinnese_food_list.dart';

class GetListFood implements ChineseeFoodRepository {
  final dio = Dio();

  @override
  Future<List<ChinneseFoodList>> getChineseeFood() async {
    try {
      final result = await dio.get(
        'https://my-burger-api.herokuapp.com/burgers',
      );

      if (result.statusCode == 200) {
        final List<dynamic> data = result.data;
        return data
            .map(
              (json) => ChinneseFoodList.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      } else if (result.statusCode! >= 500) {
        throw Exception('Gagal, server error. Silakan cek koneksi Anda.');
      } else {
        throw Exception('Gagal mengambil data, kode: ${result.statusCode}');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan saat mengambil data: ${e.toString()}');
    }
  }
}
