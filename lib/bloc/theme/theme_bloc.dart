import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitialState()) {
    on<ThemeToggleEvent>(_themeToggleEvent);
    on<NavbarIndexEvent>((event, emit) {
      emit(state.copyWith(navbarIndex: event.navbarIndex));
    });
  }

  void _themeToggleEvent(ThemeToggleEvent event, Emitter<ThemeState> emit) {
    ThemeState newThemeState = ThemeState(
      isDarkMode: !state.isDarkMode,
      navbarIndex: 0,
    );
    emit(newThemeState);
  }
}
