import 'package:direct_app/appbar/modal_appbar.dart';
import 'package:direct_app/class/texto_class.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/config/value_notifier_config.dart';
import 'package:direct_app/model/ddi_model.dart';
import 'package:direct_app/text/subtitulo_text.dart';
import 'package:direct_app/text/texto_text.dart';
import 'package:direct_app/theme/ui_cor.dart';
import 'package:flutter/material.dart';

class DdiModal extends StatefulWidget {
  const DdiModal({super.key});

  @override
  State<DdiModal> createState() => _DdiModalState();
}

class _DdiModalState extends State<DdiModal> {
  void _selecionarDdi(DdiModel item) {
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
            Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: const SubtituloText(texto: SELECIONE),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listaDdi.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => _selecionarDdi(listaDdi[index]),
                  child: Container(
                    color: currentDdi.value.codigo == listaDdi[index].codigo
                        ? UiCor.principal
                        : null,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    height: 48,
                    child: Row(
                      children: [
                        TextoText(texto: listaDdi[index].bandeira),
                        const SizedBox(width: 16),
                        Expanded(child: TextoText(texto: listaDdi[index].nome)),
                        TextoText(texto: listaDdi[index].ddi),
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
