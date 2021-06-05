import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_task_auth/controller/AuthController.dart';
import 'package:firebase_task_auth/controller/tasksController.dart';
import 'package:firebase_task_auth/view/LoginPage.dart';
import 'package:firebase_task_auth/view/updateTask.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addTask.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Task"),
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () async {
                  await Auth().signOut();
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                })
          ],
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return Text('Loading');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return new ListView(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      return new ListTile(
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: (){
                            TasksController().deleteTask(document.id);
                          },
                        ),
                        hoverColor: Colors.blueAccent,
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => updateTask(
                            description: document['description'],
                            title: document['title'],
                            id: document.id,
                          )));
                        } ,
                        title: Text(document['title']),
                        subtitle: Text(document['description']),
                      );
                    }).toList(),
                  );
              }
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddTask()));
          },
          child: Icon(Icons.add),
    ),
    );

  }
}
