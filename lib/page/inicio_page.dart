import 'package:direct_app/appbar/inicio_appbar.dart';
import 'package:direct_app/button/bandeira_button.dart';
import 'package:direct_app/button/primeiro_button.dart';
import 'package:direct_app/button/segundo_button.dart';
import 'package:direct_app/class/telefone_class.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/config/value_notifier_config.dart';
import 'package:direct_app/input/celular_input.dart';
import 'package:direct_app/mixin/validator_mixin.dart';
import 'package:direct_app/text/texto_text.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> with ValidatorMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TelefoneClass _telefoneClass = TelefoneClass();
  final TextEditingController _controller = TextEditingController();

  String telefone = "";

  void _iniciarChat() async {
    if (_formKey.currentState!.validate()) {
      String completo = "${currentDdi.value.ddi} $telefone";
      _telefoneClass.iniciarChat(completo);
    }
  }

  void _limparNumero() {
    setState(() {
      telefone = "";
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const InicioAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const TextoText(texto: INICIO_DESCRICAO),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BandeiraButton(),
                    Expanded(
                      child: CelularInput(
                        controller: _controller,
                        callback: (value) => setState(() => telefone = value),
                        hintText: INICIO_HINT,
                        keyboardType: TextInputType.phone,
                        validator: (value) => combinarValidacao([
                          () => inNotEmpty(value!),
                          () => tamanhoCelular(value!),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SegundoButton(
                    callback: () => _limparNumero(),
                    texto: CANCELAR,
                  ),
                  const SizedBox(width: 16),
                  PrimeiroButton(
                    callback: () => _iniciarChat(),
                    texto: INICAR_CHAT,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
