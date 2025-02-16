import 'package:flutter_sound/flutter_sound.dart';
import 'package:speakly/infrastructure/models/instructions/exam_type.dart';
import 'package:speakly/infrastructure/models/instructions/instruction.dart';
import 'package:speakly/infrastructure/models/instructions/question.dart';

abstract class InstructionsState {
  final bool loading;
  final int examId;

  InstructionsState({this.loading = true,this.examId = -1});
}

class InstructionsExamStart extends InstructionsState {
  final InstructionModel instruction;

  InstructionsExamStart({InstructionModel? instruction,super.loading,super.examId}):
  instruction = instruction ?? InstructionModel.fromJson({});

  InstructionsExamStart copyWith({ExamType? exam,InstructionModel? instruction,bool? loading,int? examId})=>InstructionsExamStart(
    instruction: instruction ?? this.instruction,
    loading: loading ?? this.loading,
    examId: examId ?? this.examId,
  );
}

class InstructionQuestion extends InstructionsState{
  final QuestionModel questionModel;
  final FlutterSoundRecorder recorder = FlutterSoundRecorder();
  
  InstructionQuestion({required this.questionModel, super.loading, super.examId});

  InstructionQuestion copyWith({QuestionModel? questionModel, bool? loading, int? examId}) => InstructionQuestion(
    questionModel: questionModel ?? this.questionModel,
    loading: loading ?? this.loading,
    examId: examId ?? this.examId,
  );
}
