import 'coordinate.dart';

class Routes implements Coordinate {
  const Routes._({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  static const main = Routes._(
    name: 'main_page',
    path: '/main',
  );

  static const auth = Routes._(
    name: 'auth_page',
    path: '/auth',
  );

  static const welcome = Routes._(
    name: 'welcome_page',
    path: '/welcome',
  );

  static const registration = Routes._(
    name: 'registration_page',
    path: '/registration',
  );

  static const splash = Routes._(
    name: 'splash_page',
    path: '/splash',
  );

  static const intro = Routes._(
    name: 'intro_page',
    path: '/intro',
  );

  static const instructions = Routes._(
    name: 'instructions_page',
    path: '/instructions',
  );
  

  @override
  String toString() => 'name=$name, path=$path';
}
