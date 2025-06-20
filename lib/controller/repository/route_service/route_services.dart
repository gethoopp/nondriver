import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';

Future<List<LatLng>> getRoutePoints(LatLng start, LatLng end) async {
  final dio = Dio();
  const apiKey = '5b3ce3597851110001cf62482c0f04ff140741b7bea2f1769d1dbb22';

  final url =
      'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}';

  try {
    final response = await dio.get(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Accept':
              'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8',
        },
      ),
    );

    if (response.statusCode == 200) {
      final coords =
          response.data['features'][0]['geometry']['coordinates'] as List;
      return coords
          .map<LatLng>(
            (coord) => LatLng(coord[1].toDouble(), coord[0].toDouble()),
          )
          .toList();
    } else {
      throw Exception(
        'Gagal mengambil rute, status code: ${response.statusCode}',
      );
    }
  } catch (e) {
    throw Exception('Terjadi kesalahan saat mengambil rute: $e');
  }
}
