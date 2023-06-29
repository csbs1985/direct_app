import 'package:direct_app/class/routes_class.dart';
import 'package:direct_app/page/doar_page.dart';
import 'package:direct_app/page/historico_page.dart';
import 'package:direct_app/page/inicio_page.dart';
import 'package:direct_app/page/splash_screen_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RoutesEnum.SPLASH.value,
  routes: [
    GoRoute(
      path: RoutesEnum.DOAR.value,
      pageBuilder: (context, state) => transicaoPaginas(
        context: context,
        state: state,
        child: const DoarPage(),
      ),
    ),
    GoRoute(
      path: RoutesEnum.HISTORICO.value,
      pageBuilder: (context, state) => transicaoPaginas(
        context: context,
        state: state,
        child: const HistoricoPage(),
      ),
    ),
    GoRoute(
      path: RoutesEnum.INICIO.value,
      pageBuilder: (context, state) => transicaoPaginas(
        context: context,
        state: state,
        child: const InicioPage(),
      ),
    ),
    GoRoute(
      path: RoutesEnum.SPLASH.value,
      pageBuilder: (context, state) => transicaoPaginas(
        context: context,
        state: state,
        child: const SplashScreenPage(),
      ),
    ),
  ],
);
