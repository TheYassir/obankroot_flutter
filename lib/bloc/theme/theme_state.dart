part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool isDarkMode;
  final int navbarIndex;

  const ThemeState({required this.isDarkMode, required this.navbarIndex});

  ThemeState copyWith({bool? isDarkMode, int? navbarIndex}) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      navbarIndex: navbarIndex ?? this.navbarIndex,
    );
  }

  @override
  List<Object?> get props => [
        isDarkMode,
        navbarIndex,
      ];
}

class ThemeInitialState extends ThemeState {
  const ThemeInitialState()
      : super(
          isDarkMode: false,
          navbarIndex: 0,
        );
}
