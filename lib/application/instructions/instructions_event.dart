abstract class InstructionsEvent {}

class InstructionsGetEvent extends InstructionsEvent {}

class InstructionExamEvent extends InstructionsEvent {
  final String part;

  InstructionExamEvent({required this.part});
}

class InstructionExamQuestionEvent extends InstructionsEvent {
  final String part;
  final int id;

  InstructionExamQuestionEvent({required this.part, required this.id});
}
