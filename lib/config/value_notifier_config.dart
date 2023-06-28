import 'package:direct_app/model/ddi_model.dart';
import 'package:flutter/material.dart';

final ValueNotifier<PaisModel> currentDdi = ValueNotifier<PaisModel>(PaisModel(
  nome: "Brazil",
  bandeira: "🇧🇷",
  codigo: "BR",
  ddi: "+55",
));

ValueNotifier<Brightness> currentTema = ValueNotifier(
    WidgetsBinding.instance.platformDispatcher.platformBrightness);
