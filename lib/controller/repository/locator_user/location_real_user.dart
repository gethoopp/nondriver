import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ondriver/controller/repository/locator_user/base_location_user.dart';

class LocationRealUser implements BaseLocationUser {
  @override
  Future<String> getLocationUser() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placeMark = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placeMark.isNotEmpty) {
        final Placemark place = placeMark[0];
        String location = '${place.locality}, ${place.administrativeArea}';
        return location;
      } else {
        return 'Lokasi tidak ditemukan';
      }
    } catch (e) {
      return 'Gagal mendapatkan lokasi: $e';
    }
  }

  @override
  Future<bool> getPermisionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Cek apakah layanan lokasi aktif
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Cek izin aplikasi
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    if (permission == LocationPermission.whileInUse) {
      return true;
    } else if (permission == LocationPermission.always) {
      return true;
    } else {
      return false;
    }
  }
}
