part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class AddProductToStoreLoadingState extends SettingsState {}

final class AddProductToStoreSuccessState extends SettingsState {}

final class AddProductToStoreErrorState extends SettingsState {
  final String error;
  AddProductToStoreErrorState({required this.error});
}
