
abstract class WelcomeState {}

 class WelcomeFirst extends WelcomeState {}

 class WelcomeSecend extends WelcomeState {
  final int index;
  WelcomeSecend({this.index=0});
}