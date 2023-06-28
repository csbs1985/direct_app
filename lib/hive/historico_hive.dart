import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoricoHive {
  final _historicoBox = Hive.box('historico');

  salvarHistorico(Map<String, dynamic> historico) async {
    await _historicoBox.add(historico);
  }

  deletarHistorico() async {
    await _historicoBox.clear();
  }

  pegarHistorico() {
    return _historicoBox.values;
  }

  verificarHistorico() {
    return _historicoBox.isNotEmpty;
  }
}
