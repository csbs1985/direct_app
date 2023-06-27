mixin ValidatorMixin {
  String? inNotEmpty(String? value) {
    if (value!.isEmpty) return "este campo é obrigatório";
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
