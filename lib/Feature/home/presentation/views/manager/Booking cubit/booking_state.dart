import 'package:shawati/Feature/home/data/model/booking_model/booking_model.dart';
import 'package:shawati/Feature/home/data/model/booking_model/rental.dart';
import 'package:shawati/Feature/home/data/model/booking_with_id_model/booking_with_id_model.dart';
import 'package:shawati/Feature/home/data/model/payment_model/payment_model.dart';

sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingSucc extends BookingState {
  final BookingModel Model;
  BookingSucc({required this.Model});
}

final class BookingError extends BookingState {
  final String msg;
  BookingError({required this.msg});
}

final class GetBookingDataWithIDLoading extends BookingState {}

final class GetBookingDataWithIDSucc extends BookingState {
  final BookingWithIdModel Model;
  GetBookingDataWithIDSucc({required this.Model});
}

final class GetBookingDataWithIDError extends BookingState {
  final String msg;
  GetBookingDataWithIDError({required this.msg});
}

final class ADDBookingLoading extends BookingState {}

final class ADDBookingSucc extends BookingState {
  final String msq;
  ADDBookingSucc({required this.msq});
}

final class ADDBookingError extends BookingState {
  final String msg;
  ADDBookingError({required this.msg});
}

final class CheckData extends BookingState {}

final class GetPaymentError extends BookingState {
  final String msg;
  GetPaymentError({required this.msg});
}

final class GetPaymentLoading extends BookingState {}

final class GetPaymentSucc extends BookingState {
  final PaymentModel model;
  GetPaymentSucc({required this.model});
}

final class AddAttachMentLoading extends BookingState {}

final class AddAttachMentSucc extends BookingState {
  final String txt;
  AddAttachMentSucc({required this.txt});
}

final class AddAttachMentError extends BookingState {
  final String msg;
  AddAttachMentError({required this.msg});
}
