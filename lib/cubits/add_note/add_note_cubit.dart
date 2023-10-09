import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notee/constants/const.dart';
import 'package:notee/cubits/add_note/add_note_state.dart';
import 'package:notee/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(InitialAddNote());
  static AddNoteCubit get(context) => BlocProvider.of(context);

  addNote(NoteModel note) async {
    emit(LoadingAddNote());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBooks);
      await notesBox.add(note);
      emit(SuccessAddNote());
    } catch (e) {
      debugPrint(e.toString());
      emit(FailureAddNote(e.toString()));
    }
  }
}
