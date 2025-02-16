import 'package:bloc/bloc.dart';
import 'package:speakly/domain/provider/instruction_service.dart';
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
     }
    });

    add(InstructionsGetEvent());
  }
}
