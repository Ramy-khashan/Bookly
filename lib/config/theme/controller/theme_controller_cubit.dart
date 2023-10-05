import 'package:bookly/core/utils/shared_prefrance_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_string.dart';

part 'theme_controller_state.dart';

class ThemeControllerCubit extends Cubit<ThemeControllerState> {
  ThemeControllerCubit() : super(ThemeControllerInitial());
  bool isDarkMode = true;
  getSavedMode() {
    emit(ThemeControllerInitial());
    isDarkMode =
        PreferenceUtils.getString(AppString.themeKey) == "true" ? true : false;
    emit(GetSavedTheme());
  }

  static ThemeControllerCubit get(context) => BlocProvider.of(context);
  changeMode( ) {
    emit(GetNewThemeState());

    isDarkMode = !isDarkMode;

    PreferenceUtils.setString(AppString.themeKey, isDarkMode.toString());
    emit(ChangeThemeState());
  }
}
