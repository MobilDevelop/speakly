
class InstructionModel{
  int id;
  String examType;
  String examSection;
  String value;
  
  InstructionModel({required this.id,required this.examType,required this.value,required this.examSection});

  factory InstructionModel.fromJson(Map<String,dynamic>json)=>InstructionModel(
    id: json['id']??-1,
    examType: json['exam_type']??"",  
    examSection: json['exam_section']??"", 
    value: json['value']??""
  );
}