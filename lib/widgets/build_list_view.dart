import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notee/cubits/notes_cubit/notes_cubit.dart';
import 'package:notee/cubits/notes_cubit/notes_state.dart';
import 'package:notee/models/note_model.dart';
import 'package:notee/widgets/notes_body.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    NotesCubit.get(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = NotesCubit.get(context).notes ?? [];
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => NotesBody(
                noteModel: notes[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemCount: notes.length,
            ));
      },
    );
  }
}
