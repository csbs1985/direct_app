import 'package:direct_app/theme/ui_borda.dart';
import 'package:direct_app/theme/ui_tamanho.dart';
import 'package:flutter/material.dart';

class IconeAppbarButton extends StatefulWidget {
  const IconeAppbarButton({
    super.key,
    required Function callback,
    required IconData icone,
  })  : _callback = callback,
        _icone = icone;

  final Function _callback;
  final IconData _icone;

  @override
  State<IconeAppbarButton> createState() => _IconeAppbarButtonState();
}

class _IconeAppbarButtonState extends State<IconeAppbarButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UiTamanho.icone,
      height: UiTamanho.icone,
      child: InkWell(
        borderRadius: BorderRadius.circular(UiBorda.circulo),
        child: Icon(widget._icone),
        onTap: () => widget._callback(),
      ),
    );
  }
}
