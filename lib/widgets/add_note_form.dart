import 'package:flutter/material.dart';
import 'package:notee/widgets/text_bottom.dart';
import 'package:notee/widgets/text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  var formKey = GlobalKey<FormState>();
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          customTextFormField(
            labelText: 'Title',
            hintText: 'Enter Title',
            prefixIcon: Icons.title,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'enter your title!!';
              }
              return null;
            },
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          customTextFormField(
            labelText: 'Content',
            hintText: 'Enter Content',
            maxLines: 5,
            prefixIcon: Icons.description_outlined,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'enter your Content!!';
              }
              return null;
            },
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          defaultButton(
            function: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            text: 'Add',
          )
        ],
      ),
    );
  }
}
