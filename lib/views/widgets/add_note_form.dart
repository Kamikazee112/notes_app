import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, content;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onSaved: (value) {
              content = value;
            },
            hint: 'Content',
            maxLine: 5,
          ),
          const SizedBox(height: 70),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                BlocProvider.of<AddNoteCubit>(context).addNote(NoteModel(
                    title: title!,
                    content: content!,
                    date: DateTime.now().toString(),
                    color: Colors.blue.value));
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
              setState(() {});
            },
            text: 'Add',
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
