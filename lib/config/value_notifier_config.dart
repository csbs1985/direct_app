import 'package:direct_app/mock/lista_pais.dart';
import 'package:direct_app/model/pais_model.dart';
import 'package:flutter/material.dart';

final ValueNotifier<PaisModel> currentPais =
    ValueNotifier<PaisModel>(listaPais[30]);

ValueNotifier<Brightness> currentTema = ValueNotifier(
    WidgetsBinding.instance.platformDispatcher.platformBrightness);
