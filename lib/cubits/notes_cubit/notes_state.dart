import 'package:notee/models/note_model.dart';

abstract class NotesState {}

class InitialNotesState extends NotesState {}

class LoadingNotesState extends NotesState {}

class SuccessNotesState extends NotesState {
  final List<NoteModel> notes;
  SuccessNotesState(this.notes);
}

class FailureNotesState extends NotesState {
  final String error;
  FailureNotesState(this.error);
}
