import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawati/Feature/home/data/repo/home_repo.dart';

part 'add_or_remove_fav_state.dart';

class AddOrRemoveFavCubit extends Cubit<AddOrRemoveFavState> {
  AddOrRemoveFavCubit(this.repo) : super(AddOrRemoveFavInitial());
  final HomeRepo repo;
  Map<int, bool> favouritesList = {};
  // Map<int, bool> favoritesListHome = {};
  // Map<int, bool> favoritesListFav = {};

  static AddOrRemoveFavCubit get(context) => BlocProvider.of(context);

  // void changeIcon({required int id}) {
  //   favoritesListHome[id] = !favoritesListHome[id]!;
  //   emit(ChangeIcon());
  // }

  // void changeIconOfFavInFav({required int id}) {
  //   favoritesListFav[id] = !favoritesListFav[id]!;
  //   emit(ChangeIcon());
  // }

  Future<void> addFav({required int id, required context}) async {
    // SearchCubit.get(context).favoritesListSearch[id] =
    // !SearchCubit.get(context).favoritesListSearch[id]!;
    // SearchCubit.get(context).changeIcon(id: id);
    favouritesList[id] = !favouritesList[id]!;
    emit(AddOrRemoveFavLoading());
    final result = await repo.addFav(id: id);
    result.fold((l) {
      favouritesList[id] = !favouritesList[id]!;

      // SearchCubit.get(context).changeIcon(id: id);

      emit(AddOrRemoveFavError(msg: l.msq.toString()));
    }, (r) => emit(AddOrRemoveFavSucc(msq: r)));
  }

  Future<void> removeFav({required int id, required context}) async {
    favouritesList[id] = !favouritesList[id]!;

    // SearchCubit.get(context).changeIcon(id: id);
    emit(AddOrRemoveFavLoading());
    final result = await repo.removeFav(id: id);
    result.fold((l) {
      favouritesList[id] = !favouritesList[id]!;

      // SearchCubit.get(context).changeIcon(id: id);
      emit(AddOrRemoveFavError(msg: l.msq.toString()));
    }, (r) => emit(AddOrRemoveFavSucc(msq: r)));
  }

  // Future<void> addFavHome({required int id, required context}) async {
  //   // SearchCubit.get(context).favoritesListSearch[id] =
  //   // !SearchCubit.get(context).favoritesListSearch[id]!;
  //   // SearchCubit.get(context).changeIcon(id: id);
  //   changeIcon(id: id);
  //   emit(AddOrRemoveFavLoading());
  //   final result = await repo.addFav(id: id);
  //   result.fold((l) {
  //     changeIcon(id: id);

  //     // SearchCubit.get(context).changeIcon(id: id);

  //     emit(AddOrRemoveFavError(msg: l.msq.toString()));
  //   }, (r) => emit(AddOrRemoveFavSucc(msq: r)));
  // }

  // Future<void> removeFavHome({required int id, required context}) async {
  //   changeIcon(id: id);

  //   // SearchCubit.get(context).changeIcon(id: id);
  //   emit(AddOrRemoveFavLoading());
  //   final result = await repo.removeFav(id: id);
  //   result.fold((l) {
  //     changeIcon(id: id);

  //     // SearchCubit.get(context).changeIcon(id: id);
  //     emit(AddOrRemoveFavError(msg: l.msq.toString()));
  //   }, (r) => emit(AddOrRemoveFavSucc(msq: r)));
  // }

  // Future<void> addFavFavList({required int id, required context}) async {
  //   // SearchCubit.get(context).favoritesListSearch[id] =
  //   // !SearchCubit.get(context).favoritesListSearch[id]!;
  //   // SearchCubit.get(context).changeIcon(id: id);
  //   changeIconOfFavInFav(id: id);
  //   emit(AddOrRemoveFavLoading());
  //   final result = await repo.addFav(id: id);
  //   result.fold((l) {
  //     changeIconOfFavInFav(id: id);

  //     // SearchCubit.get(context).changeIconOfFavInFav(id: id);

  //     emit(AddOrRemoveFavError(msg: l.msq.toString()));
  //   }, (r) => emit(AddOrRemoveFavSucc(msq: r)));
  // }

  // Future<void> removeFavFavList({required int id, required context}) async {
  //   changeIconOfFavInFav(id: id);

  //   // SearchCubit.get(context).changeIconOfFavInFav(id: id);
  //   emit(AddOrRemoveFavLoading());
  //   final result = await repo.removeFav(id: id);
  //   result.fold((l) {
  //     changeIconOfFavInFav(id: id);

  //     // SearchCubit.get(context).changeIcon(id: id);
  //     emit(AddOrRemoveFavError(msg: l.msq.toString()));
  //   }, (r) => emit(AddOrRemoveFavSucc(msq: r)));
  // }
}
