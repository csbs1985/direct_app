import 'package:direct_app/button/primeiro_button.dart';
import 'package:direct_app/button/segundo_button.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/text/subtitulo_text.dart';
import 'package:direct_app/text/texto_text.dart';
import 'package:flutter/material.dart';

class OpcoesDialog extends StatefulWidget {
  const OpcoesDialog({
    super.key,
    required Function callback,
  }) : _callback = callback;

  final Function _callback;

  @override
  State<OpcoesDialog> createState() => _OpcoesDialogState();
}

class _OpcoesDialogState extends State<OpcoesDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const SubtituloText(texto: HISTORICO_DELETAR),
      content: const SingleChildScrollView(
        child: ListBody(
          children: [
            TextoText(texto: HISTORICO_DELETAR_DESCRICAO),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SegundoButton(
              callback: () => Navigator.of(context).pop(),
              texto: NAO,
            ),
            const SizedBox(width: 16),
            PrimeiroButton(
              callback: () => widget._callback(),
              texto: SIM_DELETAR,
            ),
          ],
        ),
      ],
    );
  }
}
