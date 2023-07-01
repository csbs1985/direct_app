import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoricoHive {
  final _historicoBox = Hive.box('historico');

  Future<void> salvarHistorico(Map<String, dynamic> historico) async {
    await _historicoBox.add(historico);
  }

  Future<void> deletarHistorico() async {
    await _historicoBox.clear();
  }
}
