
abstract class MainEvent {}

class MainBottomItem extends MainEvent{
  final int index;
  MainBottomItem({required this.index});
}
