class QuestionModel {
  int id;
  int examId;
  int isComplate;
  String intro;
  String content;
  List<String> questions;

  QuestionModel({required this.id,required this.isComplate,required this.content,required this.intro,required this.questions,required this.examId});

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    id: json['id']??-1,
    examId: json['exam_id']??-1,
    isComplate: json['is_complete']??-1,
    intro: json['intro']??"",
    content: json['content']??"",
    questions: json['question']!=null?List<String>.from(json['question']):[]);
}