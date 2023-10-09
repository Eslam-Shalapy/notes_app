import 'package:flutter/material.dart';
import 'package:notee/widgets/custom_app_bar.dart';
import 'package:notee/widgets/text_form_field.dart';

class EditNote extends StatelessWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          text: 'Edit Note',
          icon: Icons.check,
          onPressedIcon: () {
            Navigator.pop(context);
          }),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customTextFormField(
              labelText: 'Title',
              hintText: 'Edit Title',
              prefixIcon: Icons.title,
            ),
            const SizedBox(
              height: 20,
            ),
            customTextFormField(
              labelText: 'Content',
              hintText: 'Edit Content',
              maxLines: 5,
              prefixIcon: Icons.description_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
