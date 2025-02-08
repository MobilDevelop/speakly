import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speakly/presentantion/routes/index_routes.dart';

abstract class AuthState {
  bool loading;
  TextEditingController emailController;

  AuthState({this.loading = false,TextEditingController? emailController}):
  emailController = emailController ?? TextEditingController();
}

class AuthInitial extends AuthState{}

class AuthLogin extends AuthState{
  TextEditingController passwordController;

  bool visibility;
  bool checked;
  bool errorEmail;

  AuthLogin({this.visibility = false, this.checked = true, this.errorEmail = false,super.emailController,TextEditingController? passwordController}):
  passwordController = passwordController ?? TextEditingController();

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
  bool checked;
  bool errorEmail;

  AuthRegistration({this.checked = true, this.errorEmail = false, super.loading,super.emailController});

  AuthRegistration copyWith({TextEditingController? emailController,bool? visibility,bool? checked,bool? errorEmail,bool? loading}){
    return AuthRegistration(
      emailController: emailController?? this.emailController, 
      errorEmail: errorEmail?? this.errorEmail,
      loading: loading ?? this.loading,
      checked: checked?? this.checked);
  }
}

class OpeanSuccesCode extends AuthState{
  final String email;
  final int time;

  OpeanSuccesCode({required this.email,this.time = 120,super.loading});

  OpeanSuccesCode copyWith({String? email, int? time, bool? loading}){
    return OpeanSuccesCode(
      email: email?? this.email, 
      loading: loading ?? this.loading,
      time: time?? this.time);
  } 
}

class CreateUser extends AuthState{
  TextEditingController fullNameController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  TextEditingController phoneController;

  XFile? userImage;

  bool visibility;
  bool visibility1;

  int genderType;
  String code;

  CreateUser({required this.code, this.visibility = false, this.visibility1 = false, super.loading, this.genderType = 0,this.userImage, TextEditingController? 
  fullNameController,TextEditingController? passwordController,TextEditingController? confirmPasswordController, TextEditingController? phoneController}):
  fullNameController = fullNameController ?? TextEditingController(),passwordController = passwordController ?? TextEditingController(),
  confirmPasswordController = confirmPasswordController?? TextEditingController(), phoneController = phoneController?? TextEditingController();

  CreateUser copyWith({TextEditingController? fullNameController,TextEditingController? passwordController,TextEditingController? confirmPasswordController, 
  TextEditingController? phoneController, bool? visibility,bool? visibility1, int? genderType,XFile? userImage, bool? loading}){
    return CreateUser(
      fullNameController: fullNameController ?? this.fullNameController, 
      passwordController: passwordController ?? this.passwordController, 
      confirmPasswordController: confirmPasswordController ?? this.confirmPasswordController, 
      phoneController: phoneController ?? this.phoneController, 
      visibility1: visibility1 ?? this.visibility1,
      visibility: visibility ?? this.visibility,
      userImage: userImage ?? this.userImage,
      loading: loading ?? this.loading,
      code: code,
      genderType: genderType ?? this.genderType);
  }

  Future<FormData> toFormData(String code,String email)async=>FormData.fromMap({
    "email": email,
    "code": code,
    "password": passwordController.text.trim(),
    "password_confirmation": confirmPasswordController.text.trim(),
    "profile[full_name]": fullNameController.text.trim(),
    "profile[gender]": genderType,
    "profile[phone]": phoneController.text,
    "profile[image]": await MultipartFile.fromFile(userImage!.path, filename: userImage!.name),
  });
}