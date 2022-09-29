import 'package:flutter/material.dart';
import 'package:notely/model/notes_model.dart';
import 'package:notely/widgets/drawer.dart';
import 'package:hive_flutter/adapters.dart';

class NoteDetailsScreen extends StatelessWidget {
  final Notes notes;
  const NoteDetailsScreen({Key? key, required this.notes}) : super(key: key);
  void deleteNote(BuildContext context) {
    var box = Hive.box<Notes>('Notes');
    box.delete(notes);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    final size = MediaQuery.of(context).size;
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
        title: Text(
          notes.title!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    notes.description!,
                    style: const TextStyle(
                      fontSize: 20,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                right: 0,
                top: size.height / 3,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.create),
                      ),
                      const SizedBox(height: 5),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.update),
                      ),
                      const SizedBox(height: 5),
                      IconButton(
                        onPressed: () => deleteNote(context),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
