import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new5/provider/task_data.dart';
import 'package:new5/screens/progrees_bar_personal.dart';
import 'package:new5/screens/progress_bar_business.dart';
import 'package:new5/task/task_design.dart';
import 'package:new5/task/task_info.dart';
import 'package:provider/provider.dart';

import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const AddTaskScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
        backgroundColor: const Color.fromRGBO(18, 107, 247, 1.0),
      ),
      backgroundColor: const Color.fromRGBO(248, 249, 252, 1.0),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(248, 249, 252, 1.0),
        actions: const [
          Icon(
            Icons.search,
            size: 30,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.notifications,
            size: 30,
            color: Colors.grey,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What's up, Joy!",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ),
            const Text(
              "CATEGORIES",
              style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(253, 253, 253, 1.0),
                    ),
                    child: Consumer<TaskData>(
                      builder: (context, obj, child) {
                        return Column(
                          children: [
                            Text(
                              "${obj.numBusiness} tasks",
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Business",
                                style: TextStyle(fontSize: 20)),
                            const SizedBox(
                              height: 10,
                            ),
                            Line()
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(253, 253, 253, 1.0),
                    ),
                    child: Consumer<TaskData>(
                      builder: (context, obj, child) {
                        return Column(
                          children: [
                            Text("${obj.numPersonal} tasks",
                                style: const TextStyle(fontSize: 20)),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Personal",
                                style: TextStyle(fontSize: 20)),
                            const SizedBox(
                              height: 10,
                            ),
                            Line2()
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "TODAY's TASKS",
              style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<TaskData>(
              builder: (context, obj, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: obj.tasks.length,
                    itemBuilder: (context, index) {
                      return TaskDesign(task: obj.tasks[index]);
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
