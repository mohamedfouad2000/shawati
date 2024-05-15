import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawati/Feature/home/data/repo/home_repo.dart';

part 'support_state.dart';

class SupportCubit extends Cubit<SupportState> {
  SupportCubit(this.repo) : super(SupportInitial());
  final HomeRepo repo;
  Future<void> addSupport(
      {required String subject, required String message}) async {
    emit(SupportLoading());
    final result = await repo.addSupport(subject: subject, message: message);
    result.fold(
      (l) => emit(SupportError(msg: l.msq.toString())),
      (r) => emit(SupportSucc(msq: r)),
    );
  }
}
