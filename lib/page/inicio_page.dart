import 'package:direct_app/appbar/inicio_appbar.dart';
import 'package:direct_app/button/bandeira_button.dart';
import 'package:direct_app/button/primeiro_button.dart';
import 'package:direct_app/button/segundo_button.dart';
import 'package:direct_app/class/ddi_class.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/config/value_notifier_config.dart';
import 'package:direct_app/input/celular_input.dart';
import 'package:direct_app/mixin/validator_mixin.dart';
import 'package:direct_app/model/ddi_model.dart';
import 'package:direct_app/text/texto_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> with ValidatorMixin {
  final DdiClass _ddiClass = DdiClass();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String phoneNumber = "11 979837936";

  void _iniciarChat() async {
    if (_formKey.currentState!.validate()) {
      final String numeroFomatado =
          _ddiClass.limparDdi(currentDdi.value.ddi + phoneNumber);
      Uri url = Uri.parse('whatsapp://send?phone=$numeroFomatado');

      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }
  }

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
              Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: currentDdi,
                      builder: (BuildContext context, DdiModel ddi, _) {
                        return const BandeiraButton();
                      },
                    ),
                    Expanded(
                      child: CelularInput(
                        callback: (value) =>
                            setState(() => phoneNumber = value),
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
                    callback: () => {},
                    texto: CANCELAR,
                  ),
                  const SizedBox(width: 16),
                  PrimeiroButton(
                    callback: () => _iniciarChat(),
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
