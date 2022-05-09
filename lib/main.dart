import 'package:flutter/material.dart';
import 'package:new5/provider/task_data.dart';
import 'package:new5/screens/add_task_screen.dart';
import 'package:new5/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'database/data.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  LocalDatabase.createDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create:(context)=>TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
