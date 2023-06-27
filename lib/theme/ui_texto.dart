import 'package:direct_app/theme/ui_cor.dart';
import 'package:flutter/material.dart';

class UiTexto {
  static const TextStyle erro = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: UiCor.erro,
  );

  static const TextStyle segundoButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: UiCor.principal,
  );
}

class UiTextoClaro {
  static const TextStyle primeiroButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: UiCor.textoEscuro,
  );

  static const TextStyle texto = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: UiCor.texto,
  );

  static const TextStyle titulo = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: UiCor.texto,
  );

  static const TextStyle hint = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: UiCor.hint,
  );
}

class UiTextoEscuro {
  static const TextStyle primeiroButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: UiCor.texto,
  );

  static const TextStyle texto = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: UiCor.textoEscuro,
  );

  static const TextStyle titulo = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: UiCor.textoEscuro,
  );

  static const TextStyle hint = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: UiCor.hintEscuro,
  );
}
