part of 'theme_bloc.dart';

abstract class ThemeEvent {
  const ThemeEvent();
}

class ThemeToggleEvent extends ThemeEvent {}

class NavbarIndexEvent extends ThemeEvent {
  final int navbarIndex;

  NavbarIndexEvent({required this.navbarIndex});
}
