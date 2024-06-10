import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Feature/home/data/model/payment_model/payment_model.dart';
import 'package:shawati/Feature/home/data/repo/home_repo.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Booking%20cubit/booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this.repo) : super(BookingInitial());
  static BookingCubit get(context) => BlocProvider.of(context);
  final HomeRepo repo;
  PaymentModel? model;
  DateTime? checkin;
  DateTime? checkout;
  TextEditingController coupon = TextEditingController();
  List<DateTime> timesCalender = [];

  Future<void> getBookingDeatilsWithId({required int id}) async {
    emit(GetBookingDataWithIDLoading());
    final result = await repo.getBookingDeatilsWithId(id: id);
    result.fold(
      (l) => emit(GetBookingDataWithIDError(msg: l.msq.toString())),
      (r) => emit(GetBookingDataWithIDSucc(Model: r)),
    );
  }

  void changecheckin(DateTime ch) {
    checkin = ch;
    emit(CheckData());
  }

  void changecheckout(DateTime ch) {
    checkout = ch;
    emit(CheckData());
  }

  Future<void> getBookingData() async {
    emit(BookingLoading());
    final result = await repo.getBooking();
    result.fold(
      (l) => emit(BookingError(msg: l.msq.toString())),
      (r) => emit(BookingSucc(Model: r)),
    );
  }

  Future<void> addBooking({
    required int id,
    required String start,
    required String end,
    required String coupon,
    // required File image,
    // required String paymentMethod,
  }) async {
    emit(ADDBookingLoading());
    final result =
        await repo.addBooking(id: id, start: start, end: end, coupon: coupon
            // image: image,
            // paymentMethod: paymentMethod,
            );
    result.fold(
      (l) => emit(ADDBookingError(msg: l.msq.toString())),
      (r) => emit(ADDBookingSucc(msq: r)),
    );
  }

  Future<void> getPaymentMethod() async {
    emit(GetPaymentLoading());
    final result = await repo.getPaymentMethod();
    result.fold(
      (l) => emit(GetPaymentError(msg: l.msq.toString())),
      (r) {
        model = r;
        emit(GetPaymentSucc(model: r));
      },
    );
  }

  Future<void> paymentMethodsUpload({
    required int bookingId,
    required int paymentMethodId,
    required File image,
  }) async {
    emit(AddAttachMentLoading());
    final result = await repo.paymentMethod(
        bookingId: bookingId, paymentMethodId: paymentMethodId, image: image);
    result.fold(
      (l) => emit(AddAttachMentError(msg: l.msq.toString())),
      (r) {
        // model = r;
        emit(AddAttachMentSucc(txt: r));
      },
    );
  }
}
