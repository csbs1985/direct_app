import 'package:direct_app/appbar/historico_appbar.dart';
import 'package:direct_app/button/icone_button.dart';
import 'package:direct_app/class/telefone_class.dart';
import 'package:direct_app/class/texto_class.dart';
import 'package:direct_app/hive/historico_hive.dart';
import 'package:direct_app/text/texto2_text.dart';
import 'package:direct_app/text/texto_text.dart';
import 'package:direct_app/widget/historico_vazio_widget.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  final HistoricoHive _historicoHive = HistoricoHive();
  final TelefoneClass _telefoneClass = TelefoneClass();
  final TextoClass _textoClass = TextoClass();

  List<dynamic> _listaHive = [];

  @override
  void initState() {
    _listaHive = _historicoHive.pegarHistorico()?.toList();
    _listaHive = _textoClass.ordenarDataRegistro(_listaHive);
    super.initState();
  }

  void _iniciarChat(String telefone) async {
    _telefoneClass.iniciarChat(telefone, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HistoricoAppbar(callback: () => {}),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: _listaHive.isEmpty
              ? const HistoricoVazioWidget()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _listaHive.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => _iniciarChat(_listaHive[index]['numero']),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextoText(
                                    texto: _listaHive[index]['numero'],
                                  ),
                                  Texto2Text(
                                    texto: _textoClass.formatarData(
                                        _listaHive[index]['dataRegistro']),
                                  ),
                                ],
                              ),
                            ),
                            IconeButton(
                              callback: () =>
                                  Share.share(_listaHive[index]['numero']),
                              icone: Icons.share,
                            ),
                            IconeButton(
                              callback: () => _listaHive.removeAt(index),
                              icone: Icons.delete,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
