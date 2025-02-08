class Universal {
  int id;
  String title;

  Universal({required this.id,required this.title});

  factory Universal.fromJsonGender(Map<String,dynamic> json)=>Universal(
    id: json['id']??-1, 
    title: json['name']??"");
}