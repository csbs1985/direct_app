import 'package:direct_app/config/constant_config.dart';

mixin ValidatorMixin {
  String? inNotEmpty(String value) {
    if (value.isEmpty) return TELEFONE_OBRIGATORIO;
    return null;
  }

  String? tamanhoTelefone(String value) {
    if (value.length < 14 || value.length > 20) return TELEFONE_INVALIDO;
    return null;
  }

  String? regexTelefone(String value) {
    RegExp regex = RegExp(
        r'^\(?(?:[14689][1-9]|2[12478]|3[1234578]|5[1345]|7[134579])\)? ?(?:[2-8]|9[1-9])[0-9]{3}\-?[0-9]{4}$');
    if (regex.hasMatch(value)) return TELEFONE_INVALIDO;
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
