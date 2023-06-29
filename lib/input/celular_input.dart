import 'package:direct_app/theme/ui_borda.dart';
import 'package:direct_app/theme/ui_texto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CelularInput extends StatelessWidget {
  final bool? autoFocus;
  final TextEditingController? controller;
  final Function callback;
  final bool? expands;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final String? Function(String?)? validator;

  const CelularInput({
    Key? key,
    this.autoFocus = false,
    this.controller,
    required this.callback,
    this.expands = false,
    this.focusNode,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.onSaved,
    this.maxLength,
    this.minLines = 1,
    this.maxLines = 1,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        autofocus: true,
        controller: controller,
        expands: expands!,
        focusNode: focusNode,
        keyboardType: keyboardType,
        onChanged: (value) => callback(value),
        onSaved: onSaved,
        maxLength: maxLength,
        minLines: minLines,
        maxLines: maxLines,
        style: Theme.of(context).textTheme.displayMedium,
        textAlignVertical: TextAlignVertical.center,
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
          counterStyle: Theme.of(context).textTheme.headlineSmall,
          hintText: hintText,
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
          errorStyle: UiTexto.erro,
          contentPadding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          border: UiBorda.celularInput,
          enabledBorder: UiBorda.celularInput,
          focusedBorder: UiBorda.celularInput,
        ),
      ),
    );
  }
}
