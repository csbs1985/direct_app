import 'package:direct_app/hive/historico_hive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class TelefoneClass {
  final HistoricoHive _historicoHive = HistoricoHive();
  final Uuid uuid = const Uuid();

  void iniciarChat(String telefone, bool salvar) async {
    String telefoneChat = removeCaracteres(telefone);
    Uri url = Uri.parse('whatsapp://send?phone=$telefoneChat');

    if (await launchUrl(url)) {
      if (salvar) salvarHistoricoHive(telefone);
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
    _historicoHive.salvarHistorico({
      "numero": telefone,
      "dataRegistro": DateTime.now().toString(),
      "idHistorico": uuid.v4(),
    });
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
}
