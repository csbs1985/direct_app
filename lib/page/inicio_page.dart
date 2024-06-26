import 'package:direct_app/appbar/inicio_appbar.dart';
import 'package:direct_app/button/bandeira_button.dart';
import 'package:direct_app/button/primeiro_button.dart';
import 'package:direct_app/button/segundo_button.dart';
import 'package:direct_app/class/telefone_class.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/config/value_notifier_config.dart';
import 'package:direct_app/input/telefone_input.dart';
import 'package:direct_app/mixin/validator_mixin.dart';
import 'package:direct_app/text/texto2_text.dart';
import 'package:direct_app/text/texto_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> with ValidatorMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TelefoneClass _telefoneClass = TelefoneClass();
  final TextEditingController _controller = TextEditingController();

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  String telefone = "";

  @override
  void initState() {
    _definirVersao();
    super.initState();
  }

  Future<void> _definirVersao() async {
    final info = await PackageInfo.fromPlatform();
    setState(() => _packageInfo = info);
  }

  Future<bool> _onWillPop() {
    SystemNavigator.pop();
    return Future.value(false);
  }

  void _iniciarChat() async {
    if (_formKey.currentState!.validate()) {
      String completo = "${currentPais.value.ddi} $telefone";
      _telefoneClass.iniciarChat(completo);
    }
  }

  void _limparNumero() {
    setState(() => telefone = "");
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        appBar: const InicioAppbar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Form(
                  key: _formKey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BandeiraButton(),
                      Expanded(
                        child: TelefoneInput(
                          controller: _controller,
                          callback: (value) => setState(() => telefone = value),
                          hintText: INICIO_HINT,
                          keyboardType: TextInputType.phone,
                          // validator: (value) => combinarValidacao([
                          //   () => inNotEmpty(value!),
                          //   () => tamanhoTelefone(value!),
                          // ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
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
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.help_outline),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextoText(texto: COMO_USAR),
                          SizedBox(height: 4),
                          Texto2Text(texto: INICIO_DESCRICAO),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                BY,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                'v${_packageInfo.version}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
