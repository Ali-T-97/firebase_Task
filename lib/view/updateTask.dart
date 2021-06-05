
import 'package:firebase_task_auth/controller/tasksController.dart';
import 'package:flutter/material.dart';


class updateTask extends StatefulWidget {
  String title;
  String description;
  String id;
  updateTask({this.description , this.title , this.id});
  @override
  _updateTaskState createState() => _updateTaskState(description,title,id);
}

class _updateTaskState extends State<updateTask> {
  String title;
  String description;
  String id;
  _updateTaskState(this.description , this.title , this.id);
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('update Task')),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                      labelText: title, border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                      labelText: description,
                      border: OutlineInputBorder()),
                  maxLines:2,
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
                      'update Task',

                    ),
                    onPressed: () {
                      if(_descriptionController.text == null){
                        TasksController().update(_titleController.text, description, id);
                      }
                      if(_titleController.text == null){
                        TasksController().update(title, _descriptionController.text, id);
                      }else{
                        TasksController().update(_titleController.text, _descriptionController.text, id);

                      }

                    },
                  ))
            ],
          )),
    );
  }
}
