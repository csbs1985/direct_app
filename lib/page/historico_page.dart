import 'package:direct_app/appbar/historico_appbar.dart';
import 'package:direct_app/button/icone_button.dart';
import 'package:direct_app/class/telefone_class.dart';
import 'package:direct_app/hive/historico_hive.dart';
import 'package:direct_app/text/texto2_text.dart';
import 'package:direct_app/text/texto_text.dart';
import 'package:direct_app/dialog/dialog_widget.dart';
import 'package:direct_app/widget/historico_vazio_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:share_plus/share_plus.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  final HistoricoHive _historicoHive = HistoricoHive();
  final TelefoneClass _telefoneClass = TelefoneClass();

  final _historicoBox = Hive.box('historico');

  List<Map<String, dynamic>> _listaHistorico = [];

  @override
  void initState() {
    super.initState();
    setState(() => _listaHistorico = _telefoneClass.atualizarItens());
  }

  void _iniciarChat(String telefone) {
    _telefoneClass.iniciarChat(telefone);
    setState(() => _listaHistorico = _telefoneClass.atualizarItens());
  }

  void _deletarItem(item) {
    _historicoBox.delete(item);
    setState(() => _listaHistorico = _telefoneClass.atualizarItens());
  }

  Future<void> _deletarTudo() async {
    Navigator.of(context).pop();
    await _historicoHive.deletarHistorico();
    setState(() => _listaHistorico = _telefoneClass.atualizarItens());
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OpcoesDialog(callback: () => _deletarTudo());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HistoricoAppbar(callback: () => _showAlertDialog()),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: _listaHistorico.isEmpty
              ? const HistoricoVazioWidget()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _listaHistorico.length,
                  itemBuilder: (_, int index) {
                    final currentItem = _listaHistorico[index];

                    return InkWell(
                      onTap: () => _iniciarChat(currentItem['numero']),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextoText(
                                    texto: currentItem['numero'],
                                  ),
                                  Texto2Text(
                                    texto: _telefoneClass.formatarData(
                                        currentItem['dataRegistro']),
                                  ),
                                ],
                              ),
                            ),
                            IconeButton(
                              callback: () =>
                                  Share.share(currentItem['numero']),
                              icone: Icons.share,
                            ),
                            IconeButton(
                              callback: () => _deletarItem(currentItem['key']),
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
