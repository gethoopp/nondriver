import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repository/locator_user/location_user.dart';

part 'location_real_user_state.dart';

class LocationRealUserCubit extends Cubit<LocationRealUserState> {
  final BaseLocationUser locationUser;
  LocationRealUserCubit(this.locationUser) : super(LocationRealUserLoaded());

  Future<void> locationPermission() async {
    try {
      final result = await locationUser.getPermisionLocation();
      emit(LocationRealUserSucces(result));
    } catch (e) {
      emit(LocationRealUserError(e.toString()));
    }
  }

  Future<String> locationGetResult() async {
    try {
      final result = await locationUser.getLocationUser();
      emit(LocationRealUserSucces(result));
      return result;
    } catch (e) {
      emit(LocationRealUserError(e.toString()));
      throw Exception(e.toString());
    }
  }
}
