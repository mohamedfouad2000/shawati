import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawati/Feature/home/data/repo/home_repo.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.repo) : super(LocationInitial());
  final HomeRepo repo;
  Future<void> setLocation({required double lat, required double long}) async {
    emit(LocationLoading());
    final result = await repo.setLocation(lat: lat, long: long);

    result.fold(
      (l) => emit(LocationError(msg: l.msq.toString())),
      (r) => emit(LocationSucc(msq: r)),
    );
  }
}
