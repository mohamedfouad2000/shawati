import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shawati/Feature/home/data/model/profile_model/profile_model.dart';
import 'package:shawati/Feature/home/data/repo/home_repo.dart';
import 'package:shawati/Feature/home/presentation/views/manager/profile%20cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.repo) : super(ProfileCubitInitial());
  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);
  final HomeRepo repo;
  ProfileModel? model;
  String? place = '';
  String? placeAr = '';

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    final result = await repo.getProfile();
    result.fold(
      (l) => emit(ProfileError(msg: l.msq.toString())),
      (r) async {
        model = r;
        // print("//////////");
        // print();
        // print(model?.data?.lng);
        // List<Location> locations =
        //     await locationFromAddress("Gronausestraat 710, Enschede");
        if (model!.data!.lat != null && model!.data!.lng != null) {
          setLocaleIdentifier('en');
          List<Placemark> placemarks = await placemarkFromCoordinates(
            double.parse(model!.data!.lat!.toString()),
            double.parse(model!.data!.lng!.toString()),
          );

          place =
              "${placemarks[0].country ?? ''} ${placemarks[0].name ?? ''} ${placemarks[0].locality ?? ''}";

          setLocaleIdentifier('ar');
          List<Placemark> placemarkArabic = await placemarkFromCoordinates(
            double.parse(model!.data!.lat!.toString()),
            double.parse(model!.data!.lng!.toString()),
          );

          placeAr =
              "${placemarkArabic[0].country ?? ''} ${placemarkArabic[0].name ?? ''} ${placemarkArabic[0].locality ?? ''}";
        } else {
          place = model?.data?.phone;
          placeAr = model?.data?.phone;
        }

        emit(ProfileSucc(model: r));
      },
    );
  }

  Future<void> updateProfile({
    required String name,
    required String phone,
    required String password,
    File? image,
    required String confirmPassword,
  }) async {
    emit(UpdateProfileLoading());
    final result = await repo.updateProfile(
        name: name,
        phone: phone,
        image: image,
        password: password,
        confpassword: confirmPassword);
    result.fold(
      (l) => emit(UpdateProfileError(msg: l.msq.toString())),
      (r) => emit(UpdateProfileSucc(msq: r)),
    );
  }

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    final result = await repo.deleteAccount();
    result.fold(
      (l) => emit(DeleteAccountError(msg: l.msq.toString())),
      (r) => emit(DeleteAccountSucc(msq: r)),
    );
  }
}
