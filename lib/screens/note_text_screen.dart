import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notely/model/notes_model.dart';
import 'package:notely/screens/note_screen.dart';

class NoteTextScreen extends StatefulWidget {
  const NoteTextScreen({Key? key}) : super(key: key);

  @override
  State<NoteTextScreen> createState() => _NoteTextScreenState();
}

class _NoteTextScreenState extends State<NoteTextScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  noteScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NoteScreen()),
    );
  }

  void addNote() async {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      var note = Notes(
        title: titleController.text,
        description: descriptionController.text,
      );
      Box<Notes> box = Hive.box<Notes>('Notes');
      await box.add(note);
      titleController.text = "";
      descriptionController.text = "";

      noteScreen();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF403B36),
            size: 25,
          ),
        ),
        title: const Text(
          "New Note",
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.more_vert,
              color: Color(0xFF403B36),
            ),
          ),
        ],
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Title"),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFF403B36),
              ),
              cursorColor: const Color(0xFF403B36),
              controller: titleController,
            ),
            TextFormField(
              maxLines: 12,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Add Note",
              ),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              cursorColor: const Color(0xFF403B36),
              controller: descriptionController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFD9614C),
        tooltip: "save your note",
        onPressed: addNote,
        child: const Icon(
          Icons.save,
        ),
      ),
    );
  }
}
