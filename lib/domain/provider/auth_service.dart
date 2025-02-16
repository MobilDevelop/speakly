import 'package:dio/dio.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/domain/myDio/my_dio.dart';

class AuthService {
  Dio dio = Mydio().dio();

  Future<String> sendEmail(String email)async{
    try {
      Response response = await dio.post(AppContatants.registration,data: {"email":email});
      return Future.value(response.data['message']);
    } catch (e) {
      return Future.value("error");
    }
  }

  Future<String> verifyCode(String email,String code)async{
    try {
      Response response = await dio.post(AppContatants.verifyCode,data: {"email":email,"code":code});
      return Future.value(response.data['message']);
    } catch (e) {
      return Future.value("error");
    }
  }

  Future<String> login(String email,String password)async{
    try {
      Response response = await dio.post(AppContatants.login,data: {"email":email,"password":password});
      return Future.value(response.data['token']);
    } catch (e) {
      return Future.value("");
    }
  }

  Future<String> createUser(FormData data)async{
    try {
      Response response = await dio.post(AppContatants.createUser,data: data);
      return Future.value(response.data['message']);
    } catch (e) {
      return Future.value("error");
    }
  }
}