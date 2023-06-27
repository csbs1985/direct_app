import 'package:direct_app/theme/ui_cor.dart';
import 'package:direct_app/theme/ui_texto.dart';
import 'package:flutter/material.dart';

ValueNotifier<Brightness> currentTema = ValueNotifier(Brightness.light);

class UiTema {
  static ThemeData tema = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    brightness: Brightness.light,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: UiCor.fundo),
    colorScheme: const ColorScheme.light(
      background: UiCor.fundo,
      primary: UiCor.principal,
      onPrimaryContainer: UiCor.input,
      secondary: UiCor.icone,
      onPrimary: UiCor.borda,
    ),
    navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: UiCor.fundo, elevation: 0),
    scaffoldBackgroundColor: UiCor.fundo,
    textTheme: const TextTheme(
      displayLarge: UiTextoClaro.titulo,
      displayMedium: UiTextoClaro.texto,
      displaySmall: UiTextoClaro.hint,
      labelLarge: UiTextoClaro.primeiroButton,
    ),
  );

  static ThemeData temaEscuro = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: UiCor.fundoEscuro),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: UiCor.fundoEscuro,
      primary: UiCor.principal,
      onPrimaryContainer: UiCor.inputEscuro,
      secondary: UiCor.iconeEscuro,
      onPrimary: UiCor.bordaEscura,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: UiCor.fundoEscuro,
      elevation: 0,
    ),
    scaffoldBackgroundColor: UiCor.fundoEscuro,
    textTheme: const TextTheme(
      displayLarge: UiTextoEscuro.titulo,
      displayMedium: UiTextoEscuro.texto,
      displaySmall: UiTextoEscuro.hint,
      labelLarge: UiTextoEscuro.primeiroButton,
    ),
  );
}
