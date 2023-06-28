import 'package:direct_app/model/ddi_model.dart';
import 'package:intl/intl.dart';

class TextoClass {
  String limparDdi(String value) {
    String output = value.replaceAll(' ', '').replaceAll('+', '');
    return output;
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
