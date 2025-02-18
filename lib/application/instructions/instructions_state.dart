import 'dart:async';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speakly/infrastructure/models/instructions/exam_type.dart';
import 'package:speakly/infrastructure/models/instructions/instruction.dart';
import 'package:speakly/infrastructure/models/instructions/question.dart';

abstract class InstructionsState {
  final bool loading;
  final int examId;
   bool speechFirst;

  InstructionsState({this.loading = true,this.examId = -1,this.speechFirst = true});
  
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
  final bool enableMic;
  final bool isSpeech;
  final int index;
  final int time;
  final QuestionModel questionModel;
  
  final FlutterSoundRecorder recorder;
  final FlutterTts flutterTts;

  StreamSubscription<int>? stream;
  
  InstructionQuestion({super.speechFirst,required this.questionModel, super.loading, super.examId,this.enableMic = false,this.isSpeech = true,this.stream, this.time=0,
  this.index = 0, FlutterSoundRecorder? recorder,FlutterTts? flutterTts}):recorder = recorder ?? FlutterSoundRecorder(),flutterTts = flutterTts ?? FlutterTts();

  InstructionQuestion copyWith({QuestionModel? questionModel, bool? loading, int? examId,bool? enableMic,bool? speechFirst,int? time,
  int? index, bool? isSpeech,FlutterSoundRecorder? recorder,FlutterTts? flutterTts,StreamSubscription<int>? stream}) => InstructionQuestion(
    questionModel: questionModel ?? this.questionModel,
    loading: loading ?? this.loading,
    examId: examId ?? this.examId,
    enableMic: enableMic ?? this.enableMic,
    recorder: recorder ?? this.recorder,
    flutterTts: flutterTts ?? this.flutterTts,
    isSpeech: isSpeech ?? this.isSpeech,
    speechFirst: speechFirst ?? this.speechFirst,
    index: index ?? this.index,
    stream: stream ?? this.stream,
    time: time ?? this.time,
  );
}
