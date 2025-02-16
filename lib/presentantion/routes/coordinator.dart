import 'package:speakly/presentantion/pages/auth/auth_page.dart';
import 'package:speakly/presentantion/pages/instructions/instructions_page.dart';
import 'package:speakly/presentantion/pages/intro/intro_page.dart';
import 'package:speakly/presentantion/pages/main/main_page.dart';
import 'package:speakly/presentantion/pages/splash/splash_page.dart';
import 'package:speakly/presentantion/pages/welcome/welcome_page.dart';
import 'index_routes.dart';

final GoRouter router = GoRouter(
    initialLocation: Routes.splash.path,
    debugLogDiagnostics: true,
    routes: <GoRoute>[

       GoRoute(
        name: Routes.splash.name,
        path: Routes.splash.path,
        pageBuilder: (context, state) => buildPageWithDefaultTransition1<void>(
          context: context,
          state: state,
          child: const SplashPage(),
        ),
       ),

       GoRoute(
        name: Routes.auth.name,
        path: Routes.auth.path,
        pageBuilder: (context, state) => buildPageWithDefaultTransition2<void>(
          context: context,
          state: state,
          child: const AuthPage(),
        ),
       ),

       GoRoute(
        name: Routes.main.name,
        path: Routes.main.path,
        pageBuilder: (context, state) => buildPageWithDefaultTransition2<void>(
          context: context,
          state: state,
          child: const MainPage(),
        ),
       ),

       GoRoute(
        name: Routes.welcome.name,
        path: Routes.welcome.path,
        pageBuilder: (context, state) => buildPageWithDefaultTransition2<void>(
          context: context,
          state: state,
          child: const WelcomePage(),
        ),
       ),

       GoRoute(
        name: Routes.intro.name,
        path: Routes.intro.path,
        pageBuilder: (context, state) => buildPageWithDefaultTransition2<void>(
          context: context,
          state: state,
          child: const IntroPage(),
        ),
       ),

       GoRoute(
        name: Routes.instructions.name,
        path: Routes.instructions.path,
        pageBuilder: (context, state) => buildPageWithDefaultTransition2<void>(
          context: context,
          state: state,
          child: InstructionsPage(type: state.extra as String),
        ),
       ),


    ],
    errorBuilder: (context, state) => const SizedBox());


    CustomTransitionPage buildPageWithDefaultTransition1<T>({
  required BuildContext context, 
  required GoRouterState state, 
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => ScaleTransition(scale: animation, child: child),
  );
 }

 CustomTransitionPage buildPageWithDefaultTransition2<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

CustomTransitionPage<T> buildPageWithDefaultTransition<T>({
  required BuildContext context, 
  required GoRouterState state, 
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // O'ngdan ochiladigan animatsiya
      final Offset begin = Offset(1.0, 0.0); // O'ngdan boshlanish
      final Offset end = Offset.zero; // Yopish
      final Tween<Offset> offsetTween = Tween(begin: begin, end: end);
      final Animation<Offset> offsetAnimation = animation.drive(offsetTween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}