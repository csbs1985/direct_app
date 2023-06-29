import 'package:direct_app/hive/historico_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

  String formatarTelefone(int telefone) {
    String phoneNumber = telefone.toString();

    if (phoneNumber.startsWith('0800') || phoneNumber.startsWith('0300')) {
      return '0800 ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    } else if (phoneNumber.startsWith('9')) {
      return '9${phoneNumber.substring(1, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else {
      return '${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4)}';
    }
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
}
