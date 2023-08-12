import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/repository/note_repository.dart';

import '../../models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  Future addNote(NoteModel noteModel) async {
    try {
      emit(NotesLoadingStates());
      final response = await NoteRepository().addNote(noteModel);
      print("response : ${response}");
      if (response == "success") {
        emit(NoteAddedState());
      } else {
        emit(NoteErrorState(errorMsg: response));
      }
    } catch (e) {
      emit(NoteErrorState(errorMsg: e.toString()));
    }
  }
}
