// ignore_for_file: avoid_print

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
      emit(SuccessAddNote());
      await notesBox.add(note);
    } catch (e) {
      print(e.toString());
      emit(FailureAddNote(e.toString()));
    }
  }
}
