import 'package:direct_app/button/icone_appbar_button.dart';
import 'package:direct_app/class/routes_class.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class InicioAppbar extends StatefulWidget implements PreferredSizeWidget {
  const InicioAppbar({super.key});

  @override
  State<InicioAppbar> createState() => _InicioAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _InicioAppbarState extends State<InicioAppbar> {
  void _compartilharTelefone() {
    Share.share(
        "$COMPARTILHAR_WHATSAPP https://api.whatsapp.com/send?1=pt_BR&phone=5511979837936");
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        IDENTIDADE,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      titleSpacing: 16,
      actions: [
        IconeAppbarButton(
          callback: () => context.push(RoutesEnum.DOAR.value),
          icone: Icons.favorite_border,
        ),
        IconeAppbarButton(
          callback: () => context.push(RoutesEnum.HISTORICO.value),
          icone: Icons.schedule,
        ),
        IconeAppbarButton(
          callback: () => _compartilharTelefone(),
          icone: Icons.contact_phone_outlined,
        ),
      ],
    );
  }
}
