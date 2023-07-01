import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/text/texto2_text.dart';
import 'package:direct_app/theme/ui_borda.dart';
import 'package:flutter/material.dart';

class HistoricoVazioWidget extends StatelessWidget {
  const HistoricoVazioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(UiBorda.arredondada),
        ),
        child: const Texto2Text(texto: HISTORICO_VAZIO),
      ),
    );
  }
}
