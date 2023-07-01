import 'package:direct_app/button/icone_appbar_button.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/config/value_notifier_config.dart';
import 'package:direct_app/text/subtitulo_text.dart';
import 'package:direct_app/theme/ui_cor.dart';
import 'package:flutter/material.dart';

class ModalAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const ModalAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentTema,
      builder: (BuildContext context, Brightness tema, _) {
        bool isEscuro = tema == Brightness.dark ? true : false;

        return AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          iconTheme:
              IconThemeData(color: isEscuro ? UiCor.iconeEscuro : UiCor.icone),
          title: const SubtituloText(texto: SELECIONE),
          leading: IconeAppbarButton(
            callback: () => Navigator.of(context).pop(),
            icone: Icons.close,
          ),
        );
      },
    );
  }
}
