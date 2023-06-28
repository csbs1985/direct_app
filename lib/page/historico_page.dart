import 'package:direct_app/appbar/historico_appbar.dart';
import 'package:direct_app/button/icone_button.dart';
import 'package:direct_app/class/texto_class.dart';
import 'package:direct_app/hive/historico_hive.dart';
import 'package:direct_app/text/texto2_text.dart';
import 'package:direct_app/text/texto_text.dart';
import 'package:flutter/material.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  final TextoClass _textoClass = TextoClass();
  final HistoricoHive _historicoHive = HistoricoHive();

  List<dynamic> _listaHive = [];
  List<dynamic> _listaHistorico = [];

  @override
  void initState() {
    _listaHive = _historicoHive.pegarHistorico()?.toList();
    _listaHistorico = _textoClass.ordenarDataRegistro(_listaHive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HistoricoAppbar(callback: () => {}),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _listaHistorico.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextoText(
                              texto: _textoClass.formatarTelefoneCompleto(
                                  _listaHistorico[index]['numero']),
                            ),
                            Texto2Text(
                              texto: _textoClass.formatarData(
                                  _listaHistorico[index]['dataRegistro']),
                            ),
                          ],
                        ),
                      ),
                      IconeButton(
                        callback: () => {},
                        icone: Icons.share,
                      ),
                      IconeButton(
                        callback: () => {},
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
