import 'package:direct_app/button/icone_appbar_button.dart';
import 'package:direct_app/class/routes_class.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_share/social_share.dart';

class InicioAppbar extends StatefulWidget implements PreferredSizeWidget {
  const InicioAppbar({super.key});

  @override
  State<InicioAppbar> createState() => _InicioAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _InicioAppbarState extends State<InicioAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        IDENTIDADE,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      actions: [
        IconeAppbarButton(
          callback: () => SocialShare.shareOptions(
              "Esta é minha conta whatsapp https://api.whatsapp.com/send?1=pt_BR&phone=5511979837936"),
          icone: Icons.contact_phone,
        ),
        IconeAppbarButton(
          callback: () => context.push(RoutesEnum.HISTORICO.value),
          icone: Icons.history,
        ),
        IconeAppbarButton(
          callback: () => context.push(RoutesEnum.DOAR.value),
          icone: Icons.favorite,
        ),
      ],
    );
  }
}
