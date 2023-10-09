import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notee/constants/const.dart';
import 'package:notee/cubits/notes_cubit/notes_state.dart';
import 'package:notee/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(InitialNotesState());
  static NotesCubit get(context) => BlocProvider.of(context);

  fetchAllNotes(NoteModel noteModel) async {
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBooks);
      List<NoteModel> notes = noteBox.values.toList();
      emit(SuccessNotesState(notes));
    } catch (e) {
      debugPrint(e.toString());
      emit(FailureNotesState(e.toString()));
    }
  }
}
