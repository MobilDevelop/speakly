
abstract class AuthEvent {}

class LoginEvent extends AuthEvent{}

class RegistrationEvent extends AuthEvent{}

class PasswordVisibleEvent extends AuthEvent{
  final bool visible;

   PasswordVisibleEvent({required this.visible});
}

class ChekedEvent extends AuthEvent{
  final bool check;

   ChekedEvent({required this.check});
}

class AuthSuccessEvent extends AuthEvent{
 final int type;
 final String text;
 
 AuthSuccessEvent({required this.type,required this.text});
}

class GoogleEvent extends AuthEvent{}