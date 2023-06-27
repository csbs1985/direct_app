import 'package:direct_app/class/ddi_class.dart';
import 'package:direct_app/theme/ui_outline.dart';
import 'package:direct_app/theme/ui_texto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        autofocus: autoFocus!,
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
          FilteringTextInputFormatter.digitsOnly,
          TelefoneInputFormatter(),
        ],
        decoration: InputDecoration(
          counterStyle: Theme.of(context).textTheme.headlineSmall,
          hintText: hintText,
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
          hintStyle: Theme.of(context).textTheme.displaySmall,
          errorStyle: UiTexto.erro,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 8,
          ),
          border: UiOutline.celularInput,
          enabledBorder: UiOutline.celularInput,
          focusedBorder: UiOutline.celularInput,
        ),
      ),
    );
  }
}

class TelefoneInputFormatter extends TextInputFormatter {
  final DdiClass _ddiClass = DdiClass();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final formattedValue =
        _ddiClass.formatarTelefone(int.tryParse(newValue.text) ?? 0);
    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
