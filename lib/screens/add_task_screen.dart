import 'package:flutter/material.dart';
import 'package:new5/provider/task_data.dart';
import 'package:new5/screens/home_screen.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController tasktitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 253, 253, 1.0),
      floatingActionButton: SizedBox(
        width: 180,
        child: Consumer<TaskData>(builder:(context,obj,child){
          return FloatingActionButton.extended(
            heroTag: null,
            onPressed: () {
              String type="Business";
              if(obj.color==Colors.pink){
                type="Personal";
              }
              obj.addTask(tasktitle.text,type);
              Navigator.pop(context);
            },
            backgroundColor: const Color.fromRGBO(18, 107, 247, 1.0),
            icon: const Icon(Icons.arrow_upward),
            label: const Text(
              "New Task",
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(253, 253, 253, 1.0),
        title: const Text("Add Task"),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.close,
                color: Colors.black,
              ),
              minWidth: 30,
              shape: const CircleBorder(
                  side: BorderSide(color: Colors.grey, width: 2)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextFormField(
              controller: tasktitle,
                validator: (text) {
                  if (text==null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(253, 253, 253, 0),
                    hintText: "Enter new task",
                    hintStyle: TextStyle(
                        fontSize: 26,
                        color: Color.fromRGBO(117, 133, 189, 1.0)),
                    border: OutlineInputBorder(borderSide: BorderSide.none))),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 130,
                    child: FloatingActionButton.extended(
                      onPressed: () {},
                      label: const Text(
                        "Today",
                        style: TextStyle(
                            fontSize: 22,
                            color: Color.fromRGBO(117, 133, 189, 1.0)),
                      ),
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Color.fromRGBO(117, 133, 189, 1.0),
                      ),
                      backgroundColor: const Color.fromRGBO(253, 253, 253, 1.0),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Consumer<TaskData>(builder: (context,obj,child){
                    return InkWell(
                      onTap: (){
                        obj.changeColor();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: const Color.fromRGBO(231, 233, 248, 1.0),
                                width: 3)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: obj.color, width: 3),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: obj.color),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },)
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.folder_open_outlined,
                      size: 30,
                      color: Color.fromRGBO(117, 133, 189, 1.0),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.assistant_photo_outlined,
                      size: 30,
                      color: Color.fromRGBO(117, 133, 189, 1.0),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bedtime_outlined,
                      size: 30,
                      color: Color.fromRGBO(117, 133, 189, 1.0),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
