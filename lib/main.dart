

import 'package:flutter/material.dart';
import 'package:flutter_database_floor/database/note_database.dart';
import 'package:flutter_database_floor/screen/home.dart';
import 'package:get/get.dart';


void main(){
  runApp(MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FutureBuilder<NoteDatabase>(
        future: $FloorNoteDatabase.databaseBuilder('name.db').build(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            Get.put(snapshot.data!.noteDao);
            return Home();
          }
          else if(snapshot.hasError){
            return Center(child: Text('Error'),);
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }
}