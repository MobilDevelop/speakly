import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speakly/application/instructions/instructions_bloc.dart';
import 'package:speakly/application/instructions/instructions_event.dart';
import 'package:speakly/application/instructions/instructions_state.dart';
import 'package:speakly/presentantion/assets/res/app_icons.dart';
import 'package:speakly/presentantion/components/animation_loading/main_loading.dart';
import 'package:speakly/presentantion/routes/index_routes.dart';
import 'components/exam_start_view.dart';
import 'components/question_view.dart';

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => InstructionsBloc(type),
     child: Stack(
      children: [
        Positioned.fill(child: SvgPicture.asset(AppIcons.backTest,fit: BoxFit.cover)),
        
        BlocBuilder<InstructionsBloc,InstructionsState>(
          builder: (context, state){
            if(state is InstructionsExamStart){
              return ExamStartView( 
                title: state.instruction.examSection == "part_one"? "Part 1":
                state.instruction.examSection == "part_two"?"Part 2": "Instruction",
                desc: state.instruction.value,
                startPress: () => state.instruction.examSection.isEmpty?
                
                context.read<InstructionsBloc>().add(InstructionExamEvent(part: state.instruction.examSection)):
                context.read<InstructionsBloc>().add(InstructionExamQuestionEvent(part: state.instruction.examSection,id: state.examId)),
                
                close: () => context.pop(),
              );
            }
            return SizedBox.shrink();
          }),

        BlocBuilder<InstructionsBloc,InstructionsState>(builder: (context, state) {
         if(state is InstructionQuestion){
          return QuestionView(
            enableMic: state.enableMic,
            isSpeech: state.isSpeech,
            time: state.time,
            close: () => context.pop(),
            micPress: ()=>context.read<InstructionsBloc>().add(InstructionMicPressEvent(enableMic: !state.enableMic,id: state.questionModel.id)),
          );
         } 
          return SizedBox.shrink();
        }),
        
        BlocBuilder<InstructionsBloc,InstructionsState>(builder: (context, state) => state.loading? LoadingAnimation(isBlur: ""):SizedBox.shrink())
      ],
     ),
    );
  }
}