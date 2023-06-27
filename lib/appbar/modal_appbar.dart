import 'package:direct_app/button/icone_button.dart';
import 'package:flutter/material.dart';

class ModalAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const ModalAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconeButton(
        callback: () => Navigator.of(context).pop(),
        icone: Icons.close,
      ),
    );
  }
}
