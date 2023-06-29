import 'package:direct_app/button/icone_appbar_button.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:flutter/material.dart';

class HistoricoAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const HistoricoAppbar({
    super.key,
    required Function callback,
  }) : _callback = callback;

  final Function? _callback;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        HISTORICO,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      leading: IconeAppbarButton(
        icone: Icons.arrow_back,
        callback: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconeAppbarButton(
          callback: () => _callback!(),
          icone: Icons.auto_delete,
        )
      ],
    );
  }
}
