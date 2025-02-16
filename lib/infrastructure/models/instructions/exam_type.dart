class ExamType {
  String form;
  String type;
  int topicId;
  int id;
  
  ExamType({required this.form,required this.type,required this.topicId,required this.id});

  factory ExamType.fromJson(Map<String, dynamic> json)=>ExamType(
    form: json['form']??"",
    type: json['type']??"",
    topicId: json['topic_id']??-1,
    id: json['id']??-1);
}
