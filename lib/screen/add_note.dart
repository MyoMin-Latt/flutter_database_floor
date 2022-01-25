import 'package:flutter/material.dart';
import 'package:flutter_database_floor/database/note_table.dart';
import 'package:flutter_database_floor/database/notedao.dart';
import 'package:get/get.dart';

class AddNote extends StatelessWidget {
  AddNote({ Key? key }) : super(key: key);
  NoteDao noteDao = Get.find();
  TextEditingController title = TextEditingController();
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                noteDao.addNote(Note(title.text, message.text));
                Get.back();
              }, 
              child: Text('Add Note')
            )
          ],
        ),
      ),
    );
  }
}





