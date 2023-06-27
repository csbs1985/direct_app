import 'package:direct_app/theme/ui_cor.dart';
import 'package:flutter/material.dart';
import 'package:m_toast/m_toast.dart';

class ToastClass {
  ShowMToast toast = ShowMToast();

  int duracao = 3000;

  void erro({
    required BuildContext context,
    required String texto,
  }) {
    toast.errorToast(
      context,
      message: texto,
      iconColor: Theme.of(context).colorScheme.onSecondary,
      textColor: Theme.of(context).colorScheme.onSecondary,
      backgroundColor: UiCor.erro,
      alignment: Alignment.topCenter,
      duration: duracao,
      width: double.infinity,
    );
  }

  void sucesso({
    required BuildContext context,
    required String texto,
  }) {
    toast.successToast(
      context,
      message: texto,
      iconColor: Theme.of(context).colorScheme.onSecondary,
      textColor: Theme.of(context).colorScheme.onSecondary,
      backgroundColor: UiCor.sucesso,
      alignment: Alignment.topCenter,
      duration: duracao,
      width: double.infinity,
    );
  }
}
