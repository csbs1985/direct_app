import 'package:direct_app/appbar/modal_appbar.dart';
import 'package:direct_app/config/value_notifier_config.dart';
import 'package:direct_app/mock/lista_pais.dart';
import 'package:direct_app/model/pais_model.dart';
import 'package:direct_app/text/texto_text.dart';
import 'package:direct_app/theme/ui_cor.dart';
import 'package:direct_app/theme/ui_tamanho.dart';
import 'package:flutter/material.dart';

class PaisModal extends StatefulWidget {
  const PaisModal({super.key});

  @override
  State<PaisModal> createState() => _PaisModalState();
}

class _PaisModalState extends State<PaisModal> {
  void _selecionarPais(PaisModel item) {
    setState(() => currentDdi.value = item);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ModalAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listaPais.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => _selecionarPais(listaPais[index]),
                  child: Container(
                    color: currentDdi.value.codigo == listaPais[index].codigo
                        ? UiCor.principal
                        : null,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    height: UiTamanho.lista,
                    child: Row(
                      children: [
                        TextoText(texto: listaPais[index].bandeira),
                        const SizedBox(width: 16),
                        Expanded(
                            child: TextoText(texto: listaPais[index].nome)),
                        TextoText(texto: listaPais[index].ddi),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
