import 'package:flutter/material.dart';

class Texto2Text extends StatelessWidget {
  const Texto2Text({
    super.key,
    required String texto,
  }) : _texto = texto;

  final String _texto;

  @override
  Widget build(BuildContext context) {
    return Text(
      _texto,
      style: Theme.of(context).textTheme.labelSmall,
    );
  }
}
