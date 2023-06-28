import 'package:direct_app/appbar/historico_appbar.dart';
import 'package:direct_app/button/icone_button.dart';
import 'package:direct_app/class/texto_class.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/hive/historico_hive.dart';
import 'package:direct_app/text/texto2_text.dart';
import 'package:direct_app/text/subtitulo_text.dart';
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

  var listaHistorico = [];

  @override
  void initState() {
    listaHistorico = _historicoHive.pegarHistorico()?.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HistoricoAppbar(callback: () => {}),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: SubtituloText(texto: HISTORICO),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listaHistorico.length,
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
                                    listaHistorico[index]['numero']),
                              ),
                              Texto2Text(
                                texto: _textoClass.formatarData(
                                    listaHistorico[index]['dataRegistro']),
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
            )
          ],
        ),
      ),
    );
  }
}
