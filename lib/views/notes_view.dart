import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notee/cubits/notes_cubit/notes_cubit.dart';
import 'package:notee/widgets/bottom_sheet.dart';
import 'package:notee/widgets/build_list_view.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/notes_body.dart';

class NotesViews extends StatelessWidget {
  const NotesViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBar(
          text: 'Notes',
          icon: Icons.search,
        ),
        body: const NotesListView(
          view: NotesBody(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) => const AddNotes(),
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
