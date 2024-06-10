part of 'terms_and_privacy_cubit.dart';

@immutable
sealed class TermsAndPrivacyState {}

final class TermsAndPrivacyInitial extends TermsAndPrivacyState {}

final class GetTermsAndPrivacyLoading extends TermsAndPrivacyState {}

final class GetTermsAndPrivacySucc extends TermsAndPrivacyState {
  final TermsAndPrivacyModel model;
  GetTermsAndPrivacySucc({required this.model});
}

final class GetTermsAndPrivacyError extends TermsAndPrivacyState {
  final String msg;
  GetTermsAndPrivacyError({required this.msg});
}
