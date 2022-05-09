import 'package:new5/task/task_info.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static late Database database;
  static List<Task> tasksDb = [];



  static Future<void> createDatabase() async {
    database = await openDatabase('test1.db', version: 1,
        onCreate: (database, version) async {
      print('DataBase is CREATED!!!');
      await database
          .execute(
              'CREATE TABLE TASKS ( id INTEGER PRIMARY KEY, name text,type text) ')
          .then((value) {
        print("table is CREATED!!!!");
      }).catchError((error) {
        print(error.toString());
      });
    }, onOpen: (database) {
      print('Database is OPEN!!!');
    });
  }



  static Future<void> insertIntoDataBase(String name, String type) async {
    database.rawInsert('INSERT INTO TASKS (name,type) VALUES(?,?)',
        [name, type]).then((value) {
          getDate(database);
      print("$name is name, $type is type");
    }).catchError((error) {
      print(error.toString());
    });

  }

  static Future<void> getDate(Database database) async {
    tasksDb.clear();
    database.rawQuery('SELECT * FROM TASKS').then((value) {
      value.forEach((element) {
        tasksDb.add(Task(
          id: element['id'] as int,
          name: element['name'] as String,
          type: element['type'] as String,
        ));
      });
      print('From getData function Length is : ${tasksDb.length}');
    }).catchError((error) {
      print(error.toString());
    });
  }
  static void deleteDatabase(int id){
    database.rawDelete(
        'DELETE FROM TASKS WHERE id = ?' ,[id]
    ).then((value){
      print('From getData function Length is : ${tasksDb.length}');
      print(value);
    }).catchError((error){
      print(error.toString());
    });
  }

}
