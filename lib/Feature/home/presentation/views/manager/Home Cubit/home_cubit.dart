import 'package:bloc/bloc.dart';
import 'package:shawati/Feature/home/data/model/home_model/home_model.dart';
import 'package:shawati/Feature/home/data/repo/home_repo.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Add%20Or%20Remove%20Fav/add_or_remove_fav_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Fav%20Cubit/fav_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeInitial());
  final HomeRepo repo;
  HomeModel? model;

  Future<void> getHomeData(
      {required int cateId, required String text, required context}) async {
    emit(HomeLoading());
    final result = await repo.getHomeData(cateId: cateId, text: text);
    result.fold(
      (l) => emit(HomeError(msg: l.msq.toString())),
      (r) {
        model = r;
        r.data?.services?.forEach((element) {
          AddOrRemoveFavCubit.get(context)
              .favoritesListHome
              .addAll({element.id!: element.isFavorite == 0 ? false : true});
        });
        // print('isFavorite is ${isFavoriteHome.toString()}');
        emit(HomeSucc(model: r));
      },
    );
  }
}
