import 'package:direct_app/model/ddi_model.dart';
import 'package:intl/intl.dart';

class TextoClass {
  String limparDdi(String value) {
    String output = value.replaceAll(' ', '').replaceAll('+', '');
    return output;
  }

  String formatarTelefone(int numero) {
    String numeroString = numero.toString();

    if (numeroString.length == 10) {
      return '(${numeroString.substring(0, 2)}) ${numeroString.substring(2, 6)}-${numeroString.substring(6)}';
    } else if (numeroString.length == 11) {
      return '(${numeroString.substring(0, 2)}) ${numeroString.substring(2, 7)}-${numeroString.substring(7)}';
    } else {
      return numeroString;
    }
  }

  String formatarTelefoneCompleto(String value) {
    value = value.trim();
    value = '+$value';
    value = value.replaceAll('(', ' (');
    value = value.replaceAll(')', ') ');
    return value;
  }

  String formatarData(String value) {
    DateTime dateTime = DateTime.parse(value);

    String formattedDate =
        DateFormat("dd MMM. 'de' yyyy 'às' HH'h'mm'm'").format(dateTime);

    return formattedDate;
  }

  List<PaisModel> ordenarPorNome(List<PaisModel> paises) {
    paises.sort((a, b) => a.nome.compareTo(b.nome));
    return paises;
  }

  List<dynamic> ordenarDataRegistro(List<dynamic> lista) {
    lista.sort((a, b) => b['dataRegistro'].compareTo(a['dataRegistro']));
    return lista;
  }
}
