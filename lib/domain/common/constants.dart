import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppContatants{

  static String authAdd = dotenv.env['authAdd']!; 
  

  static String registration = "${authAdd}register/email/send_code";
  static String verifyCode = "${authAdd}register/email/verify";
  static String login = "${authAdd}common/auth/login";
  static String createUser = "subscriber/user/profile";

  static String appVersion = '1.0.0';

  static int duration = 400;
}

