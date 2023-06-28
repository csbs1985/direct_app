import 'package:direct_app/appbar/voltar_appbar.dart';
import 'package:direct_app/button/primeiro_button.dart';
import 'package:direct_app/class/toast_class.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/text/texto_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoarPage extends StatefulWidget {
  const DoarPage({super.key});

  @override
  State<DoarPage> createState() => _DoarPageState();
}

class _DoarPageState extends State<DoarPage> {
  final ToastClass _toastClass = ToastClass();

  void _copiarPix(BuildContext context) {
    Clipboard.setData(const ClipboardData(text: PIX_CODIGO));
    _toastClass.sucesso(context: context, texto: PIX_COPIADO);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VoltarAppbar(texto: DOAR),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextoText(texto: DOAR_DESCRICAO),
              const SizedBox(height: 24),
              PrimeiroButton(
                callback: () => _copiarPix(context),
                texto: DOAR_BUTTON,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
