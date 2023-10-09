import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notee/constants/const.dart';
import 'package:notee/cubits/add_note/add_note_cubit.dart';
import 'package:notee/cubits/bloc_observer.dart';
import 'package:notee/models/note_model.dart';
import 'package:notee/views/notes_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBooks);
  Hive.registerAdapter(NoteModelAdapter());
  Bloc.observer = MyBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: const NotesViews(),
      ),
    );
  }
}
