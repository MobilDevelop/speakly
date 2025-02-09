
abstract class WelcomeState {}

final class WelcomeFirst extends WelcomeState {}

final class WelcomeSecend extends WelcomeState {
  final int index;
  WelcomeSecend({this.index=0});
}