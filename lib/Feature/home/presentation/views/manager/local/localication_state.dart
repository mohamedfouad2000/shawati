sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}

final class ChangeLocal extends LocalizationState {}

final class Changeloading extends LocalizationState {}

final class ChangeLocalError extends LocalizationState {}
