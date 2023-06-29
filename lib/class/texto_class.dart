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
}
