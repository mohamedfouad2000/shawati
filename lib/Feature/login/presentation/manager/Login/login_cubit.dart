import 'package:bloc/bloc.dart';
import 'package:shawati/Feature/login/data/repo/login_repo.dart';
import 'package:shawati/Feature/login/presentation/manager/Login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginInitial());
  final LoginRepo repo;

  Future<void> loginUser(
      {required String phone, required String password}) async {
    emit(LoginLoading());
    final result = await repo.loginUser(phone: phone, password: password);
    result.fold((l) => emit(LoginFailed(l.msq.toString())),
        (r) => emit(LoginSuccess(r)));
  }
}
