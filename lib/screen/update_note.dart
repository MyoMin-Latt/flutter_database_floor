import 'package:flutter/material.dart';
import 'package:flutter_database_floor/database/note_table.dart';
import 'package:flutter_database_floor/database/notedao.dart';
import 'package:get/get.dart';

class UpdateNote extends StatelessWidget {
  UpdateNote({ Key? key }) : super(key: key);  
  TextEditingController title = TextEditingController();
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    NoteDao noteDao = Get.find(); // care
    Note note = Get.arguments; // care
    title.text = note.title;
    message.text = note.message;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: message,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(
              onPressed: (){
                noteDao.updateNote(Note(title.text, message.text, id: note.id));
                Get.back();
              },
              child: Text('Update Note')
            )
          ],
        ),
      ),
    );
  }
}





