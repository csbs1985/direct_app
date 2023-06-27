import 'package:direct_app/appbar/inicio_appbar.dart';
import 'package:direct_app/button/primeiro_button.dart';
import 'package:direct_app/button/segundo_button.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/input/celular_input.dart';
import 'package:direct_app/text/texto_text.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const InicioAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const TextoText(texto: INICIO_DESCRICAO),
              const SizedBox(height: 16),
              const CelularInput(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SegundoButton(
                    callback: () => {},
                    texto: CANCELAR,
                  ),
                  const SizedBox(width: 16),
                  PrimeiroButton(
                    callback: () => {},
                    texto: INICAR_CHAT,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
