// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notee/cubits/add_note/add_note_cubit.dart';
import 'package:notee/cubits/add_note/add_note_state.dart';
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
            print('failed ${state.error}');
          } else if (state is SuccessAddNote) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is LoadingAddNote ? true : false,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
