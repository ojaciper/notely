import 'package:flutter/material.dart';
import 'package:notely/screens/note_screen.dart';
import 'package:notely/screens/note_text_screen.dart';
import 'package:notely/widgets/custom_button.dart';
import 'package:notely/widgets/drawer.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            key.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.dehaze,
            color: Color(0xFF403B36),
            size: 25,
          ),
        ),
        title: const Text(
          "All Notes",
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              color: Color(0xFF403B36),
            ),
          ),
        ],
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/img1.png',
              width: 270,
            ),
            const SizedBox(height: 20),
            const Text(
              "Create Your First Note",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                height: 1.5,
                color: Color(0xFF403B36),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Add a note about anything (your thoughts on climate change, or your history essay) and share it witht the world.",
              style: TextStyle(
                fontSize: 20,
                // fontWeight: FontWeight.w500,
                color: Color(0xFF595550),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            // const SizedBox(height: 40),
            const Spacer(),
            CustomButton(
              text: "Create A Note",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NoteTextScreen()));
              },
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => const NoteScreen()));
              },
              child: const Text(
                'Import Notes',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFD9614C),
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
