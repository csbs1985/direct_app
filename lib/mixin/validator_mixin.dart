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

  String? combinarValidacao(List<String? Function()> validators) {
    for (final item in validators) {
      final validacao = item();
      if (validacao != null) return validacao;
    }
    return null;
  }
}
