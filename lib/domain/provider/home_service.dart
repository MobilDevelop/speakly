import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/domain/failure/failure.dart';
import 'package:speakly/domain/myDio/my_dio.dart';
import 'package:speakly/infrastructure/models/home/home_info.dart';

class HomeService{
  Dio dio = Mydio().dio();

  Future<Either<Failure,HomeInfo>> getScore()async{
    try {
      Response response = await dio.get(AppContatants.homeScore);
      return right(HomeInfo.fromJson(response.data['data']));
    } catch (e) {
      return left(FailureServerError(message: "Xatolik"));
    }
  }
}