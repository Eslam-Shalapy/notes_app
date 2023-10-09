import 'package:flutter/cupertino.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key, required this.view});

  final Widget view;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => view,
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
        itemCount: 20,
      ),
    );
  }
}
