import 'package:flutter/material.dart';

class UiBorda {
  static const double circulo = 400;
  static const double quadrada = 0;
  static const double arredondada = 8;

  static OutlineInputBorder celularInput = const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(UiBorda.quadrada),
      topRight: Radius.circular(UiBorda.arredondada),
      bottomRight: Radius.circular(UiBorda.arredondada),
      bottomLeft: Radius.circular(UiBorda.quadrada),
    ),
  );

  static BorderRadius celularButton = const BorderRadius.only(
    topLeft: Radius.circular(UiBorda.arredondada),
    topRight: Radius.circular(UiBorda.quadrada),
    bottomRight: Radius.circular(UiBorda.quadrada),
    bottomLeft: Radius.circular(UiBorda.arredondada),
  );
}
