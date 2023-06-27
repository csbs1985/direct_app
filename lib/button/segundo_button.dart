import 'package:direct_app/theme/ui_borda.dart';
import 'package:direct_app/theme/ui_cor.dart';
import 'package:direct_app/theme/ui_tamanho.dart';
import 'package:direct_app/theme/ui_texto.dart';
import 'package:flutter/material.dart';

class SegundoButton extends StatefulWidget {
  const SegundoButton({
    super.key,
    required Function callback,
    required String texto,
  })  : _callback = callback,
        _texto = texto;

  final Function _callback;
  final String _texto;

  @override
  State<SegundoButton> createState() => _SegundoButtonState();
}

class _SegundoButtonState extends State<SegundoButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: () => widget._callback,
      child: Container(
        height: UiTamanho.botao,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: isPressed ? UiCor.segundoButtonAtivo : UiCor.segundoButton,
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(UiBorda.circulo),
        ),
        child: Center(
          child: Text(
            widget._texto,
            style: UiTexto.segundoButton,
          ),
        ),
      ),
    );
  }
}
