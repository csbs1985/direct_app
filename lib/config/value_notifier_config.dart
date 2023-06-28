import 'package:direct_app/model/ddi_model.dart';
import 'package:flutter/material.dart';

final ValueNotifier<DdiModel> currentDdi = ValueNotifier<DdiModel>(DdiModel(
  nome: "Brazil",
  bandeira: "🇧🇷",
  codigo: "BR",
  ddi: "+55",
));

ValueNotifier<Brightness> currentTema = ValueNotifier(
    WidgetsBinding.instance.platformDispatcher.platformBrightness);
