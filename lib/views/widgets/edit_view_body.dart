import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            title: "Edit Note",
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();

              Navigator.pop(context);
              BlocProvider.of<NotesCubit>(context).fetchNotes();
            },
          ),
          const SizedBox(height: 50),
          CustomTextField(
            hint: 'Title',
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 25),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hint: 'Content',
            maxLine: 5,
          ),
        ],
      ),
    );
  }
}
