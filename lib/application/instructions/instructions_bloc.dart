import 'dart:async';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:google_speech/google_speech.dart';
import 'package:speakly/domain/provider/instruction_service.dart';
import 'package:speakly/infrastructure/helper/helper.dart';
import 'instructions_event.dart';
import 'instructions_state.dart';

class InstructionsBloc extends Bloc<InstructionsEvent, InstructionsState> {
  InstructionsBloc(String type) : super(InstructionsExamStart()) {
 
    on<InstructionsGetEvent>((event, emit)async{
      final result = await InstructionService().getInstruction();

      if(result.isRight()){
        emit((state as InstructionsExamStart).copyWith(
          examId: await InstructionService().getExam(type),
          loading: false,
          instruction: result.toNullable()));
      }
    });


    on<InstructionExamEvent>((event, emit)async{
      emit((state as InstructionsExamStart).copyWith(loading: true));
      
      final result = await InstructionService().getSpeaking(event.part);
      if(result.isRight()){
        emit((state as InstructionsExamStart).copyWith(loading: false,instruction: result.toNullable()));
      }else{
        emit((state as InstructionsExamStart).copyWith(loading: false));
      }
    });


    on<InstructionExamQuestionEvent>((event, emit)async{
      emit((state as InstructionsExamStart).copyWith(loading: true));
     
     final result = await InstructionService().getSection(event.part, event.id);

     if(result.isRight()){
      emit(InstructionQuestion(questionModel: result.toNullable()!,loading: false));
      add(InstructionSpeechEvent(speech:(state as InstructionQuestion).questionModel.intro,isStart: true));
      await (state as InstructionQuestion).recorder.openRecorder();
      await Permission.microphone.request();
      await Permission.storage.request();
     }
    });


    on<InstructionSpeechEvent>((event, emit)async{
    final completer = Completer<void>();
    
    await (state as InstructionQuestion).flutterTts.setVolume(1);
    await (state as InstructionQuestion).flutterTts.setLanguage("en-US");
    await (state as InstructionQuestion).flutterTts.setVoice({"name": "en-GB-default", "locale": "eng-default"});
    await (state as InstructionQuestion).flutterTts.setPitch(1.0);
     // Mavjud tillarni tekshirish

    emit((state as InstructionQuestion).copyWith(isSpeech: true));
    await (state as InstructionQuestion).flutterTts.speak(event.speech);
    
    
    (state as InstructionQuestion).flutterTts.setCompletionHandler(()async{
        if(event.isStart && state.speechFirst){
          await Future.delayed(Duration(seconds: 1));
          (state as InstructionQuestion).flutterTts.speak((state as InstructionQuestion).questionModel.questions.first);
          state.speechFirst = false;
        }else if (!completer.isCompleted){
          completer.complete();
          //add(InstructionTimerEvent(duration: 60));
        }
      });

      await completer.future; 
      emit((state as InstructionQuestion).copyWith(isSpeech: false));
    });



    on<InstructionMicPressEvent>((event, emit)async{
       
     emit((state as InstructionQuestion).copyWith(enableMic: event.enableMic));

      if(event.enableMic){
      await (state as InstructionQuestion).recorder.startRecorder(toFile: 'audio.wav');
      }else{
      emit((state as InstructionQuestion).copyWith(loading: true));
      
      final serviceAccount = ServiceAccount.fromString(await rootBundle.loadString('assets/google-speech/google.json'));
      final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
      final path = await (state as InstructionQuestion).recorder.stopRecorder();

      final config = RecognitionConfig(
       encoding: AudioEncoding.LINEAR16,
       sampleRateHertz: 16000,
       languageCode: 'en-US',
       enableAutomaticPunctuation: true,
      );

    final audio = File(path!).readAsBytesSync().toList();

    final response = await speechToText.recognize(config, audio);
    final transcription = response.results.map((text) => text.alternatives.first.transcript).join('\n');

     bool result = await InstructionService().sendAnswer(transcription,(state as InstructionQuestion).questionModel.questions[(state as InstructionQuestion).index],event.id);
     
     if(result){
      emit(InstructionsExamStart(loading: true));
      add(InstructionExamEvent(part: "part_two"));

     }else{
      emit((state as InstructionQuestion).copyWith(loading: false,index: (state as InstructionQuestion).index+1));
      await Future.delayed(Duration(seconds: 1));
      add(InstructionSpeechEvent(isStart: false,speech: (state as InstructionQuestion).questionModel.questions[(state as InstructionQuestion).index]));
       }
     }
    });


    on<InstructionTimerEvent>((event, emit) {
      (state as InstructionQuestion).stream = Helper().timerStream(event.duration).listen((newTime) {
        add(InstructionUpdateEvent(time: newTime));
      });
    });


    on<InstructionUpdateEvent>((event, emit) {
      emit((state as InstructionQuestion).copyWith(time: event.time,isSpeech: !(event.time==0)));
    });



    add(InstructionsGetEvent());
  }
}