import 'package:direct_app/config/value_notifier_config.dart';
import 'package:direct_app/modal/ddi_modal.dart';
import 'package:direct_app/model/ddi_model.dart';
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
      context: context,
      barrierColor: UiCor.overlay,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (context) => const DdiModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isPressed = false;

    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: () => _abrirModal(context),
      child: Container(
        height: UiTamanho.input,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        decoration: BoxDecoration(
          color: isPressed == true
              ? UiCor.principal
              : Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: UiBorda.celularButton,
        ),
        child: ValueListenableBuilder(
          valueListenable: currentDdi,
          builder: (BuildContext context, DdiModel ddi, _) {
            return Row(
              children: [
                TextoText(texto: ddi.bandeira),
                const SizedBox(width: 8),
                TextoText(texto: ddi.ddi),
              ],
            );
          },
        ),
      ),
    );
  }
}