abstract class MainState {
  final int index;
  MainState({this.index =0});
}

final class MainInitial extends MainState {
  
  MainInitial({super.index});

  MainInitial copyWith({int? index}){
    return MainInitial(index: index ?? this.index);
  }
}
