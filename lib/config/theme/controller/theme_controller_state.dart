part of 'theme_controller_cubit.dart';

sealed class ThemeControllerState extends Equatable {
  const ThemeControllerState();

  @override
  List<Object> get props => [];
}

final class ThemeControllerInitial extends ThemeControllerState {}
final class GetSavedTheme extends ThemeControllerState {}
final class GetNewThemeState extends ThemeControllerState {}
final class ChangeThemeState extends ThemeControllerState {}
