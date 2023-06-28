import 'package:direct_app/theme/ui_borda.dart';
import 'package:flutter/material.dart';

class CelularInput extends StatefulWidget {
  const CelularInput({super.key});

  @override
  State<CelularInput> createState() => _CelularInputState();
}

class _CelularInputState extends State<CelularInput> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PadraoInput extends StatelessWidget {
  final bool? autoFocus;
  final TextEditingController? controller;
  final Function? callback;
  final bool? expands;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final String? Function(String?)? validator;

  const PadraoInput({
    Key? key,
    this.autoFocus = false,
    this.controller,
    this.callback,
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
        onChanged: (value) => callback!(value),
        onSaved: onSaved,
        maxLength: maxLength,
        minLines: minLines,
        maxLines: maxLines,
        style: Theme.of(context).textTheme.displayMedium,
        textAlignVertical: TextAlignVertical.center,
        validator: validator,
        decoration: InputDecoration(
          counterStyle: Theme.of(context).textTheme.headlineSmall,
          hintText: hintText,
          filled: true,
          // fillColor: Theme.of(context).textTheme.displaySmall,

          // errorStyle: UiTexto.erro,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(UiBorda.arredondada),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(UiBorda.arredondada),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(UiBorda.arredondada),
          ),
        ),
      ),
    );
  }
}
