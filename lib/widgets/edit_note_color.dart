import 'package:flutter/material.dart';
import 'package:notee/constants/const.dart';
import 'package:notee/models/note_model.dart';
import 'package:notee/widgets/color_list_view.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({Key? key, required this.noteModel})
      : super(key: key);
  final NoteModel noteModel;

  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {
  late int currentIndex;
  List<Color> colors = kColors;
  @override
  void initState() {
    super.initState();
    currentIndex = colors.indexOf(Color(widget.noteModel.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            currentIndex = index;
            widget.noteModel.color = colors[index].value;
            setState(() {});
          },
          child: ColorItem(
            isActive: currentIndex == index,
            color: colors[index],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 5,
        ),
        itemCount: colors.length,
      ),
    );
  }
}
