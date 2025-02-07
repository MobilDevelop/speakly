import 'package:speakly/presentantion/routes/index_routes.dart';

abstract class AuthState {}

class AuthInitial extends AuthState{}

class AuthLogin extends AuthState{
  TextEditingController emailController;
  TextEditingController passwordController;
  bool visibility;
  bool checked;
  bool errorEmail;

  AuthLogin({this.visibility = false, this.checked = false, this.errorEmail = false, TextEditingController? emailController,TextEditingController? passwordController}):
  emailController = emailController ?? TextEditingController(),passwordController = passwordController ?? TextEditingController();

  AuthLogin copyWith({TextEditingController? emailController,TextEditingController? passwordController,bool? visibility,bool? checked,bool? errorEmail}){
    return AuthLogin(
      emailController: emailController?? this.emailController, 
      passwordController: passwordController?? this.passwordController, 
      visibility: visibility?? this.visibility, 
      errorEmail: errorEmail?? this.errorEmail,
      checked: checked?? this.checked);
  }
}

class AuthRegistration extends AuthState{
  TextEditingController emailController;

  bool checked;
  bool errorEmail;

  AuthRegistration({this.checked = false, this.errorEmail = false, TextEditingController? emailController}):
  emailController = emailController ?? TextEditingController();

  AuthRegistration copyWith({TextEditingController? emailController,bool? visibility,bool? checked,bool? errorEmail}){
    return AuthRegistration(
      emailController: emailController?? this.emailController, 
      errorEmail: errorEmail?? this.errorEmail,
      checked: checked?? this.checked);
  }
}

class OpeanSuccesCode extends AuthState{}