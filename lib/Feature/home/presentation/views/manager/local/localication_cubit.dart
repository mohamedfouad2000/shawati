import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:shawati/Feature/home/data/repo/home_repo.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_state.dart';
import 'package:get/get.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit(this.repo) : super(LocalizationInitial());
  static LocalizationCubit get(context) => BlocProvider.of(context);
  final HomeRepo repo;

  Locale l = const Locale('en');
  void changelocale(String lang) async {
    emit(Changeloading());

    print("Change ");
    l = Locale(lang);
    var res = await repo.changeLang(lang: lang);

    res.fold((l) {
      emit(ChangeLocalError());
    }, (r) {
      Get.updateLocale(Locale(lang));
      emit(ChangeLocal());
    });
  }

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }
}
