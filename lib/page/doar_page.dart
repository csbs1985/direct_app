import 'package:direct_app/appbar/voltar_appbar.dart';
import 'package:direct_app/button/primeiro_button.dart';
import 'package:direct_app/class/toast_class.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/text/subtitulo_text.dart';
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
      appBar: const VoltarAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubtituloText(texto: DOAR),
              SizedBox(height: 16),
              TextoText(texto: DOAR_DESCRICAO),
              SizedBox(height: 72),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: PrimeiroButton(
          callback: () => _copiarPix(context),
          texto: DOAR_BUTTON,
        ),
      ),
    );
  }
}
