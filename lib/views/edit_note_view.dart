import 'package:flutter/material.dart';
import 'package:notee/cubits/notes_cubit/notes_cubit.dart';
import 'package:notee/models/note_model.dart';
import 'package:notee/widgets/custom_app_bar.dart';
import 'package:notee/widgets/edit_note_color.dart';
import 'package:notee/widgets/text_form_field.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key? key, required this.noteModel}) : super(key: key);
  final NoteModel noteModel;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String? title, content;
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          text: 'Edit Note',
          icon: Icons.check,
          onPressedIcon: () {
            widget.noteModel.title = title ?? widget.noteModel.title;
            widget.noteModel.subTitle = content ?? widget.noteModel.subTitle;
            widget.noteModel.save();
            NotesCubit.get(context).fetchAllNotes();
            Navigator.pop(context);
          }),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customTextFormField(
              controller: titleController,
              onTap: () {
                titleController.text = widget.noteModel.title;
              },
              labelText: 'Title',
              prefixIcon: Icons.title,
              onChanged: (data) {
                title = data;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            customTextFormField(
              controller: contentController,
              onTap: () {
                contentController.text = widget.noteModel.subTitle;
              },
              labelText: 'Content',
              maxLines: 5,
              prefixIcon: Icons.description_outlined,
              onChanged: (data) {
                content = data;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            EditColorListView(noteModel: widget.noteModel),
          ],
        ),
      ),
    );
  }
}
