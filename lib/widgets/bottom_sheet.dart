import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notee/cubits/add_note/add_note_cubit.dart';
import 'package:notee/cubits/add_note/add_note_state.dart';
import 'package:notee/cubits/notes_cubit/notes_cubit.dart';
import 'package:notee/widgets/add_note_form.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is FailureAddNote) {
          } else if (state is SuccessAddNote) {
            NotesCubit.get(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is LoadingAddNote ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
