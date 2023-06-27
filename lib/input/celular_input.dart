import 'package:direct_app/button/bandeira_button.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/config/value_notifier_config.dart';
import 'package:direct_app/mixin/validator_mixin.dart';
import 'package:direct_app/model/ddi_model.dart';
import 'package:direct_app/theme/ui_borda.dart';
import 'package:direct_app/theme/ui_texto.dart';
import 'package:flutter/material.dart';

class CelularInput extends StatefulWidget {
  const CelularInput({super.key});

  @override
  State<CelularInput> createState() => _CelularInputState();
}

class _CelularInputState extends State<CelularInput> with ValidatorMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  void _iniciarChat() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UiBorda.arredondada),
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: currentDdi,
              builder: (BuildContext context, DdiModel ddi, _) {
                return const BandeiraButton();
              },
            ),
            Expanded(
              child: TextFormField(
                autofocus: true,
                controller: _controller,
                keyboardType: TextInputType.phone,
                onChanged: (value) => {},
                // onSaved: onSaved,
                maxLines: 1,
                style: Theme.of(context).textTheme.displayMedium,
                textAlignVertical: TextAlignVertical.center,
                validator: (value) => combinarValidacao([
                  () => inNotEmpty(value),
                ]),
                decoration: InputDecoration(
                  counterStyle: Theme.of(context).textTheme.headlineSmall,
                  hintText: INICIO_HINT,
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  hintStyle: Theme.of(context).textTheme.displaySmall,
                  errorStyle: UiTexto.erro,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(UiBorda.quadrada),
                      topRight: Radius.circular(UiBorda.arredondada),
                      bottomRight: Radius.circular(UiBorda.arredondada),
                      bottomLeft: Radius.circular(UiBorda.quadrada),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(UiBorda.quadrada),
                      topRight: Radius.circular(UiBorda.arredondada),
                      bottomRight: Radius.circular(UiBorda.arredondada),
                      bottomLeft: Radius.circular(UiBorda.quadrada),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(UiBorda.quadrada),
                      topRight: Radius.circular(UiBorda.arredondada),
                      bottomRight: Radius.circular(UiBorda.arredondada),
                      bottomLeft: Radius.circular(UiBorda.quadrada),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
