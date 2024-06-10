part of 'serves_prices_cubit.dart';

@immutable
sealed class ServesPricesState {}

final class ServesPricesInitial extends ServesPricesState {}

final class ServesPricesLoading extends ServesPricesState {}

final class ServesPricesSucc extends ServesPricesState {
  final ServesPriceDetailsModel servesPrices;
  ServesPricesSucc({required this.servesPrices});
}

final class ServesPricesError extends ServesPricesState {
  final String msg;
  ServesPricesError({required this.msg});
}
