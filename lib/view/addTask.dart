
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_task_auth/controller/tasksController.dart';
import 'package:flutter/material.dart';


class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Task')),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                      labelText: 'Enter Title', border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: TextField(
                  controller: _descriptionController,
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: 'Enter Description',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.purple.shade100;
                          return Theme.of(context).primaryColor;
                        })),
                    child: Text(
                      'Add Task',

                    ),
                    onPressed: () {
                      TasksController().addtasktofirebase(_titleController.text, _descriptionController.text);
                      Navigator.pop(context);
                    },
                  ))
            ],
          )),
    );
  }
}
