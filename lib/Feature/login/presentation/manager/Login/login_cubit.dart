import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/login/data/repo/login_repo.dart';
import 'package:shawati/Feature/login/presentation/manager/Login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginInitial());
  final LoginRepo repo;

  Future<void> loginUser({
    required String phone,
    required String password,
    required String fcmToken,
  }) async {
    emit(LoginLoading());
    final result = await repo.loginUser(
        lang: Get.locale?.languageCode == 'ar' ? 'ar' : 'en',
        phone: phone,
        password: password,
        fcmToken: fcmToken);
    result.fold((l) => emit(LoginFailed(l.msq.toString())),
        (r) => emit(LoginSuccess(r)));
  }
}
