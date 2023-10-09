abstract class AddNoteState {}

class InitialAddNote extends AddNoteState {}

class LoadingAddNote extends AddNoteState {}

class SuccessAddNote extends AddNoteState {}

class FailureAddNote extends AddNoteState {
  final String error;
  FailureAddNote(this.error);
}
