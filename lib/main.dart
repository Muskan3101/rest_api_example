import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_example/student_modelClass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController idEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REST Api"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: nameEditingController,
            decoration: InputDecoration(
              hintText: "Name"
            ),
          ),
          TextField(
            controller: idEditingController,
            decoration: InputDecoration(
              hintText: "id"
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: (){
                fetchData();
              },
              child: Text("Fetch")
          ),
          ElevatedButton(
              onPressed: (){
                insertData();
              },
              child: Text("Insert")
          ),
        ],
      ),
    );
  }

  void fetchData() async{
    var uri = Uri.parse("https://applore-123-default-rtdb.firebaseio.com/student.json");
    var response = await http.get(uri);
    // print(response.body);
    var jsonDecodeData = json.decode(response.body);
    //print(jsonDecodeData);
    for(int i=0;i<=2;i++){
      var student = Student2.fromJson(jsonDecodeData[i]);
      print(student.name);
      print(student.id);
      print("command run");
    }
  }

  void insertData() async{
    var uri = Uri.parse("https://applore-123-default-rtdb.firebaseio.com/student.json");
    var jsonData = json.encode({"name":nameEditingController.text,"id":idEditingController.text});
    var response = await http.post(uri,body: jsonData);
    print("data inserted");
    print(response.body);
  }
}


