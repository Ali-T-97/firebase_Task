import 'package:cloud_firestore/cloud_firestore.dart';

class TasksController{

  addtasktofirebase(String title , String description) async {

    await FirebaseFirestore.instance
        .collection('tasks')
        .doc()
        .set({
      'title': title,
      'description': description,

    });
  }

  deleteTask(String id)async{
    await FirebaseFirestore.instance.collection('tasks').doc(id).delete();
  }
  void update(String title , String description , String id)async {
    await FirebaseFirestore.instance.collection('tasks').doc(id).update({
      'title': title,
      'description': description,
    });
  }
}