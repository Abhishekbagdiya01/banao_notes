part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

class NotesLoadingStates extends NoteState {}

class NotesLoadedStates extends NoteState {
  final List<NoteModel> arrNotes;
  NotesLoadedStates(this.arrNotes);
}

class NoteAddedState extends NoteState {}

class NoteUpdateState extends NoteState {}

class NoteErrorState extends NoteState {
  String errorMsg;
  NoteErrorState({required this.errorMsg});
}
