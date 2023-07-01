import 'package:direct_app/hive/historico_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class TelefoneClass {
  final HistoricoHive _historicoHive = HistoricoHive();
  final Uuid uuid = const Uuid();

  final _historicoBox = Hive.box('historico');

  void iniciarChat(String telefone) async {
    String telefoneChat = removeCaracteres(telefone);
    Uri url = Uri.parse('whatsapp://send?phone=$telefoneChat');

    if (await launchUrl(url)) {
      salvarHistoricoHive(telefone);
      atualizarItens();
    }
  }

  String removeCaracteres(String telefone) {
    final specialCharacters = ['+', '(', ')', '-', ' '];

    for (var character in specialCharacters) {
      telefone = telefone.replaceAll(character, '');
    }

    return telefone;
  }

  void salvarHistoricoHive(String telefone) {
    Map<String, dynamic> item = {
      "numero": telefone,
      "dataRegistro": DateTime.now().toString(),
      "idHistorico": uuid.v4(),
    };

    _historicoHive.salvarHistorico(item);
  }

  List<Map<String, dynamic>> atualizarItens() {
    final data = _historicoBox.keys.map((key) {
      final item = _historicoBox.get(key);
      return {
        "key": key,
        "numero": item["numero"],
        "dataRegistro": item["dataRegistro"],
        "idHistorico": item["idHistorico"],
      };
    }).toList();

    return data.reversed.toList();
  }

  String formatarData(String value) {
    DateTime dateTime = DateTime.parse(value);

    String formattedDate =
        DateFormat("dd MMM. 'de' yyyy 'às' HH'h'mm'm'").format(dateTime);

    return formattedDate;
  }
}
