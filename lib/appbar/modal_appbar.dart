import 'package:direct_app/button/icone_appbar_button.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/text/subtitulo_text.dart';
import 'package:flutter/material.dart';

class ModalAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const ModalAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const SubtituloText(texto: SELECIONE),
      leading: IconeAppbarButton(
        callback: () => Navigator.of(context).pop(),
        icone: Icons.close,
      ),
    );
  }
}
