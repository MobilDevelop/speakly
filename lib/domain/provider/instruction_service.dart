import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:speakly/domain/common/constants.dart';
import 'package:speakly/domain/failure/failure.dart';
import 'package:speakly/domain/myDio/my_dio.dart';
import 'package:speakly/infrastructure/models/instructions/instruction.dart';
import 'package:speakly/infrastructure/models/instructions/question.dart';

class InstructionService {
  Dio dio = Mydio().dio();

  Future<int> getExam(String type)async{
    try {
      Response response = await dio.post(AppContatants.exam,data: {"form":type});
      return Future.value(response.data["id"]??-1);
    } catch (e) {

      return Future.value(-1);
    }
  }

  Future<Either<Failure,InstructionModel>> getInstruction()async{
    try {
      Response response = await dio.get(AppContatants.instuction);
      return right(InstructionModel.fromJson(response.data['data']));
    } catch (e) {
      return left(FailureServerError(message: "error"));
    }
  }

  Future<Either<Failure,InstructionModel>> getSpeaking(String part)async{
    try {
      Response response = await dio.get(AppContatants.speaking,queryParameters: {"filter[exam_section]": part});
      return right(InstructionModel.fromJson(response.data['data']));
    } catch (e) {
      return left(FailureServerError(message: "error"));
    }
  }

  Future<Either<Failure,QuestionModel>> getSection(String part,int id)async{
    try {
      Response response = await dio.post(AppContatants.section,data: {"exam_id": id, "section": part});
      return right(QuestionModel.fromJson(response.data));
    } catch (e) {
      return left(FailureServerError(message: "error"));
    }
  }
}