import 'package:bloc/bloc.dart';
import 'package:flutter/physics.dart';
import 'package:meta/meta.dart';
import 'package:shawati/Feature/home/data/repo/home_repo.dart';

part 'get_max_min_state.dart';

class GetMaxMinCubit extends Cubit<GetMaxMinState> {
  GetMaxMinCubit(this.repo) : super(GetMaxMinInitial());

  final HomeRepo repo;
  Future<void> getMaxMinPrice() async {
    emit(GetMaxLoading());
    final result = await repo.getMinMaxPrice();
    result.fold(
      (l) => emit(GetMaxError(msg: l.msq.toString())),
      (r) {
        emit(GetMaxSucc(min: r.data!.minPrice!, max: r.data!.maxPrice!));
      },
    );
  }
}
