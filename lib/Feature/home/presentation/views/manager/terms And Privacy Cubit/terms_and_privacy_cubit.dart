import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shawati/Feature/home/data/model/terms_and_privacy_model/terms_and_privacy_model.dart';
import 'package:shawati/Feature/home/data/repo/home_repo.dart';

part 'terms_and_privacy_state.dart';

class TermsAndPrivacyCubit extends Cubit<TermsAndPrivacyState> {
  TermsAndPrivacyCubit(this.repo) : super(TermsAndPrivacyInitial());
  final HomeRepo repo;
  Future<void> getTermsAndPrivacy() async {
    emit(GetTermsAndPrivacyLoading());
    final result = await repo.getTermsAndPrivacy();
    result.fold(
      (l) => emit(GetTermsAndPrivacyError(msg: l.msq.toString())),
      (r) => emit(GetTermsAndPrivacySucc(model: r)),
    );
  }
}
