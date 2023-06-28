import 'package:direct_app/button/icone_appbar_button.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/text/subtitulo_text.dart';
import 'package:flutter/material.dart';

class VoltarAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const VoltarAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const SubtituloText(texto: DOAR),
      leading: IconeAppbarButton(
        icone: Icons.arrow_back,
        callback: () => Navigator.of(context).pop(),
      ),
    );
  }
}
