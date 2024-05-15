import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawati/Feature/home/data/model/fav_model/fav_model.dart';
import 'package:shawati/Feature/home/data/repo/home_repo.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Add%20Or%20Remove%20Fav/add_or_remove_fav_cubit.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.repo) : super(FavInitial());
  final HomeRepo repo;
  static FavCubit get(context) => BlocProvider.of(context);

  Future<void> getFavList({required context}) async {
    emit(FavLoading());
    final result = await repo.getFavList();
    result.fold((l) => emit(FavFailed(message: l.msq.toString())), (r) {
      r.data?.favorites?.forEach((element) {
        AddOrRemoveFavCubit.get(context)
            .favoritesListFav
            .addAll({element.service!.id!: true});
        print(
            "fav is ${AddOrRemoveFavCubit.get(context).favoritesListFav.toString()}");
      });
      emit(FavSuccess(model: r));
    });
  }
}
