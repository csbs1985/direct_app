import 'package:direct_app/theme/ui_borda.dart';
import 'package:direct_app/theme/ui_cor.dart';
import 'package:direct_app/theme/ui_texto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ValueNotifier<Brightness> currentTema = ValueNotifier(Brightness.light);

class UiTema {
  static definirTema() {
    currentTema.value =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    trocarTema();
  }

  static trocarTema() {
    bool isEscuro = currentTema.value == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: isEscuro ? Brightness.light : Brightness.dark,
        statusBarBrightness: isEscuro ? Brightness.light : Brightness.dark,
        statusBarColor: isEscuro ? UiCor.statusBarEscura : UiCor.statusBar,
        systemNavigationBarIconBrightness:
            isEscuro ? Brightness.light : Brightness.dark,
        systemNavigationBarColor:
            isEscuro ? UiCor.navigationBarEscuro : UiCor.navigationBar,
      ),
    );

    ThemeData();
  }

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
    dialogTheme: DialogTheme(
      actionsPadding: const EdgeInsets.all(16),
      backgroundColor: UiCor.fundo,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiBorda.arredondada),
      ),
    ),
    iconTheme: const IconThemeData(color: UiCor.icone),
    inputDecorationTheme:
        const InputDecorationTheme(hintStyle: UiTextoClaro.hint),
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
    dialogTheme: DialogTheme(
      actionsPadding: const EdgeInsets.all(16),
      backgroundColor: UiCor.fundoEscuro,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiBorda.arredondada),
      ),
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
