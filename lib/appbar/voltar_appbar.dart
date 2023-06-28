import 'package:direct_app/button/icone_appbar_button.dart';
import 'package:flutter/material.dart';

class VoltarAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const VoltarAppbar({
    super.key,
    required String texto,
  }) : _texto = texto;

  final String _texto;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        _texto,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      leading: IconeAppbarButton(
        icone: Icons.arrow_back,
        callback: () => Navigator.of(context).pop(),
      ),
    );
  }
}
