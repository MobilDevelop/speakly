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

class InstructionMicPressEvent extends InstructionsEvent {
  final bool enableMic;
  final int id;

  InstructionMicPressEvent({required this.enableMic,required this.id});
}

class InstructionSpeechEvent extends InstructionsEvent {
  final String speech;
  final bool isStart;
  final int index;

  InstructionSpeechEvent({required this.speech, required this.isStart,this.index = 1});
}

class InstructionTimerEvent extends InstructionsEvent {
  final int duration;

  InstructionTimerEvent({required this.duration});
}

class InstructionUpdateEvent extends InstructionsEvent {
  final int time;

  InstructionUpdateEvent({required this.time});
}
