import 'package:bloc/bloc.dart';
import 'package:shawati/Feature/home/data/repo/home_repo.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Getcategory%20Cubit/get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit(this.repo) : super(GetCategoryInitial());
  final HomeRepo repo;

  Future<void> getCategory() async {
    emit(GetCategoryLoading());
    var res = await repo.getCategory();
    res.fold(
      (l) => emit(GetCategoryError(msg: l.msq.toString())),
      (r) {
        emit(GetCategorySucc(list: r));
      },
    );
  }
}
