import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppContatants{

  static String authAdd = dotenv.env['authAdd']!; 

  /// home service all url 
  static String homeScore = "/common/public/records/last-result";
  
  /// auth service all url
  static String registration = "${authAdd}register/email/send_code";
  static String verifyCode = "${authAdd}register/email/verify";
  static String login = "${authAdd}login";
  static String createUser = "${authAdd}register/email/sign_up";

  /// exam service all url
  static String exam = "/subscriber/exam/exam";
  static String instuction = "/common/public/records/main-instruction";
  static String speaking = "/common/public/records/speaking-instructions";
  static String section = "/subscriber/exam/section";
  static String answer = "/subscriber/exam/section/answer";

  static String appVersion = '1.0.0';

  static int duration = 400;
}

