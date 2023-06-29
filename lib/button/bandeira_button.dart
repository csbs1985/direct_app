import 'package:direct_app/config/value_notifier_config.dart';
import 'package:direct_app/modal/pais_modal.dart';
import 'package:direct_app/model/pais_model.dart';
import 'package:direct_app/text/texto_text.dart';
import 'package:direct_app/theme/ui_borda.dart';
import 'package:direct_app/theme/ui_cor.dart';
import 'package:direct_app/theme/ui_tamanho.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BandeiraButton extends StatefulWidget {
  const BandeiraButton({super.key});

  @override
  State<BandeiraButton> createState() => _BandeiraButtonState();
}

class _BandeiraButtonState extends State<BandeiraButton> {
  void _abrirModal(BuildContext context) {
    showCupertinoModalBottomSheet(
      expand: true,
      duration: const Duration(milliseconds: 300),
      context: context,
      barrierColor: UiCor.overlay,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UiBorda.arredondada)),
      builder: (context) => const PaisModal(),
    );
  }

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: () => _abrirModal(context),
      child: Container(
        height: UiTamanho.input,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        decoration: BoxDecoration(
          color: isPressed
              ? UiCor.principal
              : Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: UiBorda.telefoneButton,
        ),
        child: ValueListenableBuilder(
          valueListenable: currentDdi,
          builder: (BuildContext context, PaisModel pais, _) {
            return Row(
              children: [
                TextoText(texto: pais.bandeira),
                const SizedBox(width: 8),
                TextoText(texto: pais.ddi),
              ],
            );
          },
        ),
      ),
    );
  }
}
