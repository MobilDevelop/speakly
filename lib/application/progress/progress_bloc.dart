import 'package:bloc/bloc.dart';
import 'progress_event.dart';
import 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  ProgressBloc() : super(ProgressInitial()) {
    on<ProgressEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
