import 'package:direct_app/button/icone_button.dart';
import 'package:direct_app/class/routes_class.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        IconeButton(
          callback: () => {},
          icone: Icons.mobile_screen_share,
        ),
        IconeButton(
          callback: () => {},
          icone: Icons.share,
        ),
        IconeButton(
          callback: () => {},
          icone: Icons.history,
        ),
        IconeButton(
          callback: () => context.push(RoutesEnum.DOAR.value),
          icone: Icons.favorite_border,
        ),
      ],
    );
  }
}
