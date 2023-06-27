import 'package:direct_app/theme/ui_borda.dart';
import 'package:direct_app/theme/ui_cor.dart';
import 'package:direct_app/theme/ui_tamanho.dart';
import 'package:flutter/material.dart';

class PrimeiroButton extends StatefulWidget {
  const PrimeiroButton({
    super.key,
    required Function callback,
    required String texto,
  })  : _callback = callback,
        _texto = texto;

  final Function _callback;
  final String _texto;

  @override
  State<PrimeiroButton> createState() => _PrimeiroButtonState();
}

class _PrimeiroButtonState extends State<PrimeiroButton> {
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
          color: isPressed ? UiCor.primeiroButtonAtivo : UiCor.primeiroButton,
          borderRadius: BorderRadius.circular(UiBorda.circulo),
        ),
        child: Center(
          child: Text(
            widget._texto,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
