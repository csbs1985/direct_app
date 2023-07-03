import 'dart:async';

import 'package:direct_app/class/routes_class.dart';
import 'package:direct_app/config/constant_config.dart';
import 'package:direct_app/text/subtitulo_text.dart';
import 'package:direct_app/text/texto2_text.dart';
import 'package:direct_app/theme/ui_cor.dart';
import 'package:direct_app/theme/ui_duracao.dart';
import 'package:direct_app/theme/ui_icone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  bool _showText = false;

  @override
  void initState() {
    super.initState();
    _systemChrome();
    _navegarInicio();
    _iniciarAnimacao();
  }

  _systemChrome() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: UiCor.fundoEscuro,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }

  _navegarInicio() async {
    await Future.delayed(const Duration(seconds: UiDuracao.splash), () {
      context.push(RoutesEnum.INICIO.value);
    });
  }

  _iniciarAnimacao() {
    // Define a duração e o tipo de animação
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Define a animação de deslocamento da imagem
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0,
          -0.1), // Ajuste o valor de -0.1 para controlar a distância do deslocamento
    ).animate(_controller);

    // Inicia a animação após 2 segundos
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _showText = true;
        _controller.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          color: UiCor.fundoEscuro,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    SlideTransition(
                      position: _animation,
                      child: SvgPicture.asset(
                        UiIcone.logo,
                        height: 70,
                        colorFilter: const ColorFilter.mode(
                          UiCor.splash,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    if (_showText)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
                        child: AnimatedOpacity(
                          opacity: _showText ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          child: const SubtituloText(texto: IDENTIDADE),
                        ),
                      ),
                    if (_showText)
                      AnimatedOpacity(
                        opacity: _showText ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: const Texto2Text(texto: SLOGAN),
                      ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              if (_showText)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: AnimatedOpacity(
                    opacity: _showText ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: const Texto2Text(texto: BY),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
