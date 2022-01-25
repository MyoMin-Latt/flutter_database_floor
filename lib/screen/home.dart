import 'package:flutter/material.dart';
import 'package:flutter_database_floor/database/note_table.dart';
import 'package:flutter_database_floor/database/notedao.dart';
import 'package:flutter_database_floor/screen/add_note.dart';
import 'package:flutter_database_floor/screen/update_note.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  NoteDao noteDao = Get.find();
  Home({ Key? key }) : super(key: key);
  List<Note> notes = [];
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Floor Database')
      ),
      body: notesList(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add', // heroTag is very important to route
            onPressed: () {
              Get.to(AddNote());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            heroTag: 'delete',
            onPressed: (){
              noteDao.deleteAllNote(notes);
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  Widget notesList(){
  return StreamBuilder<List<Note>>(
    stream: noteDao.getAllNotes(),
    builder: (BuildContext contxt, snapshot){
      if(snapshot.hasData){
        notes = snapshot.data!;
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (_, position){
            return Card(
              child: ListTile(
                title: Text(snapshot.data![position].title),
                subtitle: Text(snapshot.data![position].message,),
                trailing: IconButton(
                  onPressed: (){
                    noteDao.deleteNote(snapshot.data![position], );
                  }, 
                  icon: Icon(Icons.delete)
                ),
                leading: IconButton(
                  onPressed: (){
                    Get.to(UpdateNote(), arguments: snapshot.data![position]);
                  },
                  icon: Icon(Icons.edit),
                ),
                
              ),
            );
          }
        );
      }
      else if(snapshot.hasError){
        return Center(child: Text('Error'),);
      }
      else{
        return Center(child: CircularProgressIndicator(),);
      }
    } 
  );
}
}


