import 'package:direct_app/class/routes_class.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/text/subtitulo_text.dart';
import 'package:direct_app/text/texto2_text.dart';
import 'package:direct_app/theme/ui_cor.dart';
import 'package:direct_app/theme/ui_duracao.dart';
import 'package:direct_app/theme/ui_icone.dart';
import 'package:direct_app/theme/ui_imagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _systemChrome();
    _navegarInicio();
  }

  _systemChrome() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: UiCor.navigationBarEscuro,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }

  _navegarInicio() async {
    await Future.delayed(const Duration(seconds: UiDuracao.splash), () {
      context.push(RoutesEnum.INICIO.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(UiImagem.backgroung),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    SvgPicture.asset(UiIcone.logo, height: 80),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                      child: SubtituloText(texto: IDENTIDADE),
                    ),
                    const Texto2Text(texto: SLOGAN),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Texto2Text(texto: BY),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
