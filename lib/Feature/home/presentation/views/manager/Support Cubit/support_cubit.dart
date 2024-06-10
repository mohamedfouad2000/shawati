import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawati/Feature/home/data/model/admin_model/admin_model.dart';
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

  Future<void> getEmailAndPhone() async {
    emit(GetSettingLoading());
    final result = await repo.addSupportDataMobileAndEmail();
    result.fold(
      (l) => emit(GetSettingError(msg: l.msq.toString())),
      (r) => emit(GetSettingSucc(msq: r)),
    );
  }
}
