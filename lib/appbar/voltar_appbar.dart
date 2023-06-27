import 'package:direct_app/button/icone_button.dart';
import 'package:flutter/material.dart';

class VoltarAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const VoltarAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconeButton(
        icone: Icons.arrow_back,
        callback: () => Navigator.of(context).pop(),
      ),
    );
  }
}
