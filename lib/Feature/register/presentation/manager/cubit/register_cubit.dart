import 'package:bloc/bloc.dart';
import 'package:shawati/Feature/register/data/repo/register_repo.dart';
import 'package:shawati/Feature/register/presentation/manager/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.repo) : super(RegisterInitial());
  final RegisterRepo repo;
  Future<void> registerUser({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLoading());
    var res = await repo.registerUser(
        name: name,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword);
    res.fold((l) {
      emit(RegisterError(eroorMsq: l.msq.toString()));
    }, (r) {
      emit(RegisterSucc(model: r));
    });
  }
}
