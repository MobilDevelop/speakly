class HomeInfo{
  final int score;
  final String fullname;

  HomeInfo({required this.score,required this.fullname});

  factory HomeInfo.fromJson(Map<String,dynamic> json)=>HomeInfo(
    score: json['score']??0, 
    fullname: json['user']!=null?json['user']['profile']!=null?json['user']['profile']['full_name']??"":"":"");
}