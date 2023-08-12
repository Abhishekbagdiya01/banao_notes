import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future fetchNotes() async {
    try {
      emit(NotesLoadingStates());

      List<NoteModel> arrNotes = [];
      QuerySnapshot querySnapshot = await NoteRepository().fetchNotes();
      querySnapshot.docs.forEach((doc) {
        arrNotes.add(NoteModel.fromSnap(doc));

        emit(NotesLoadedStates(arrNotes));
      });
    } catch (e) {
      emit(NoteErrorState(errorMsg: e.toString()));
    }
  }

  Future updateNote(NoteModel noteModel) async {
    try {
      emit(NotesLoadingStates());
      final response = await NoteRepository().updateNote(noteModel);
      print("response : ${response}");
      if (response == "success") {
        emit(NoteUpdateState());
      } else {
        emit(NoteErrorState(errorMsg: response));
      }
    } catch (e) {
      emit(NoteErrorState(errorMsg: e.toString()));
    }
  }
}
