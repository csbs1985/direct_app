import 'package:direct_app/theme/ui_cor.dart';
import 'package:direct_app/theme/ui_texto.dart';
import 'package:flutter/material.dart';

ValueNotifier<Brightness> currentTema = ValueNotifier(Brightness.light);

class UiTema {
  static ThemeData tema = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: UiCor.appbar,
      elevation: 0,
      iconTheme: IconThemeData(color: UiCor.iconeAppBar),
    ),
    brightness: Brightness.light,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: UiCor.fundo),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: UiCor.navigationBar),
    colorScheme: const ColorScheme.light(
      background: UiCor.fundo,
      primary: UiCor.principal,
      onPrimaryContainer: UiCor.input,
      secondary: UiCor.icone,
      onPrimary: UiCor.borda,
      onSecondary: UiCor.textoEscuro,
    ),
    iconTheme: const IconThemeData(color: UiCor.icone),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: UiCor.fundo,
      elevation: 0,
    ),
    scaffoldBackgroundColor: UiCor.fundo,
    textTheme: const TextTheme(
      displayLarge: UiTextoClaro.titulo,
      displayMedium: UiTextoClaro.texto,
      displaySmall: UiTextoClaro.hint,
      labelLarge: UiTextoClaro.primeiroButton,
      labelMedium: UiTextoClaro.identidade,
      labelSmall: UiTextoClaro.texto2,
    ),
  );

  static ThemeData temaEscuro = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: UiCor.appbarEscura,
      elevation: 0,
      iconTheme: IconThemeData(color: UiCor.iconeAppBarEscuro),
    ),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: UiCor.fundoEscuro),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: UiCor.navigationBarEscuro),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: UiCor.fundoEscuro,
      primary: UiCor.principal,
      onPrimaryContainer: UiCor.inputEscuro,
      secondary: UiCor.iconeEscuro,
      onPrimary: UiCor.bordaEscura,
      onSecondary: UiCor.texto,
    ),
    iconTheme: const IconThemeData(color: UiCor.iconeEscuro),
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
      labelMedium: UiTextoEscuro.identidade,
      labelSmall: UiTextoEscuro.texto2,
    ),
  );
}
