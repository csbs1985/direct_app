import 'package:direct_app/theme/ui_borda.dart';
import 'package:flutter/material.dart';

class UiOutline {
  static OutlineInputBorder celularInput = const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(UiBorda.quadrada),
      topRight: Radius.circular(UiBorda.arredondada),
      bottomRight: Radius.circular(UiBorda.arredondada),
      bottomLeft: Radius.circular(UiBorda.quadrada),
    ),
  );
}
