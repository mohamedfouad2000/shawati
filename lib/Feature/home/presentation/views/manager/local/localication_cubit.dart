import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());
  static LocalizationCubit get(context) => BlocProvider.of(context);

  Locale l = const Locale('en');
  void changelocale(String lang) {
    l = Locale(lang);
    emit(ChangeLocal());
  }

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }
}
