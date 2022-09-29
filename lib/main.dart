import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notely/home.dart';
import 'package:notely/model/notes_model.dart';

late Box box;

void main() async {
  await Hive.initFlutter();
  // now let's create our hive model class
  Hive.registerAdapter<Notes>(NotesAdapter());
  box = await Hive.openBox<Notes>("Notes");
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF8EEE2),
          elevation: 0,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8EEE2),
        iconTheme: const IconThemeData(
          color: Color(0xFF403B36),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFFF8EEE2),
        ),
      ),
      home: const HomePage(),
    );
  }
}
