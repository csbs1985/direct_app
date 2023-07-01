import 'package:direct_app/theme/ui_borda.dart';
import 'package:direct_app/theme/ui_texto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TelefoneInput extends StatelessWidget {
  final TextEditingController? controller;
  final Function callback;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const TelefoneInput({
    Key? key,
    this.controller,
    required this.callback,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: (value) => callback(value),
      style: Theme.of(context).textTheme.displayMedium,
      validator: validator,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        LengthLimitingTextInputFormatter(11),
        MaskTextInputFormatter(
          mask: '(##) #####-####',
          type: MaskAutoCompletionType.lazy,
        )
      ],
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
        errorStyle: UiTexto.erro,
        contentPadding: const EdgeInsets.all(0),
        border: UiBorda.TelefoneInput,
        enabledBorder: UiBorda.TelefoneInput,
        focusedBorder: UiBorda.TelefoneInput,
      ),
    );
  }
}
