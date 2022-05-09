import 'package:flutter/material.dart';
import 'package:new5/provider/task_data.dart';
import 'package:new5/task/task_info.dart';
import 'package:provider/provider.dart';

class TaskDesign extends StatefulWidget {
  late Task task;

  TaskDesign({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskDesign> createState() => _TaskDesignState();
}

class _TaskDesignState extends State<TaskDesign> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        height: 70,
        child: ListTile(
            tileColor: const Color.fromRGBO(253, 253, 253, 1.0),
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(20)),
            title: Text(
              widget.task.name,
              style: TextStyle(
                  fontSize: 25,
                  decoration: widget.task.isChecked
                      ? TextDecoration.lineThrough
                      : null),
            ),
            leading: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: widget.task.type == "Personal"
                        ? Colors.pink
                        : Colors.blue,
                    width: 2),
              ),
              child: Checkbox(
                side: const BorderSide(color: Colors.transparent),
                value: widget.task.isChecked,
                shape: const CircleBorder(),
                onChanged: (value) {
                  setState(() {
                    widget.task.toggleChecked();
                  });
                },
              ),
            ),
            trailing: Consumer<TaskData>(builder: (context, obj, child) {
              return IconButton(
                  onPressed: () {
                    obj.deleteTask(widget.task);
                  },
                  icon: const Icon(Icons.delete));
            })),
      ),
    );
  }
}
