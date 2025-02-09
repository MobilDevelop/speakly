
abstract class AuthEvent {}

class LoginEvent extends AuthEvent{
  final String email;
  LoginEvent({this.email = ""});
}

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

class VerifyCodeConfirm extends AuthEvent{
  final String code;
  final String email;
  VerifyCodeConfirm({required this.code,required this.email});
}

class CreateUserPasswordVisible extends AuthEvent{
  final int type;

  CreateUserPasswordVisible({required this.type});
}

class GenderSelect extends AuthEvent{
  final int genderType;

  GenderSelect({required this.genderType});
}

class GetUserImage extends AuthEvent{
  final int selectType;

  GetUserImage({required this.selectType});
}

class CreateUserEvent extends AuthEvent{}

class UpdateTime extends AuthEvent{
  int newTime;
  UpdateTime({required this.newTime});
}

class GoogleEvent extends AuthEvent{}

class OTPCode extends AuthEvent {}