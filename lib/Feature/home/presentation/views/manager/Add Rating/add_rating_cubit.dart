import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawati/Feature/home/data/repo/home_repo.dart';

part 'add_rating_state.dart';

class AddRatingCubit extends Cubit<AddRatingState> {
  AddRatingCubit(this.repo) : super(AddRatingInitial());
  final HomeRepo repo;
  Future<void> addRating(
      {required String comment,
      required double rating,
      required int id}) async {
    emit(AddRatingLoading());
    final result =
        await repo.addRating(comment: comment, rating: rating, id: id);
    result.fold(
      (l) => emit(AddRatingError(msg: l.msq.toString())),
      (r) => emit(AddRatingSucc(msq: r)),
    );
  }
}
