import 'package:direct_app/config/constant_config.dart';

mixin ValidatorMixin {
  String? inNotEmpty(String value) {
    if (value.isEmpty) return CELULAR_OBRIGATORIO;
    return null;
  }

  String? tamanhoCelular(String value) {
    if (value.length != 15) return CELULAR_TAMANHO;
    return null;
  }

  String? regexCelular(String value) {
    RegExp regex = RegExp(
        r'^\(?(?:[14689][1-9]|2[12478]|3[1234578]|5[1345]|7[134579])\)? ?(?:[2-8]|9[1-9])[0-9]{3}\-?[0-9]{4}$');
    if (regex.hasMatch(value)) return CELULAR_INVALIDO;
    return null;
  }

  String? combinarValidacao(List<String? Function()> validators) {
    for (final item in validators) {
      final validacao = item();
      if (validacao != null) return validacao;
    }
    return null;
  }
}
