\\main.dart

import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


\\homepage.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController controller = TextEditingController();
  final List<Map<String, String>> responses = [];

  void sendMessage() async {
    Uri url = Uri.parse("https://sugoi-api.vercel.app/chat?msg=" + controller.text);
    http.Response response = await http.get(url);
    dynamic data = json.decode(response.body);
    setState(() {
      responses.add({
        "msg": data["msg"],
        "response" : data["response"]
      });
    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.pinkAccent[200],
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              responses.clear();
            });
          },
            icon: Icon(Icons.delete),
            color: Colors.white, )
        ],
      ),
      backgroundColor: Colors.pinkAccent[50],
      body: Column(
        children: [
          Expanded(child: ListView.builder(
              itemCount: responses.length,
              itemBuilder: (context, index) {
            return Column(
              children:[
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80),
                  child: ListTile(
                    title: Text(
                      responses[index]["msg"]!,
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white),
                    ),
                    tileColor: Colors.pinkAccent,
                    trailing: Icon(Icons.person,color: Colors.white,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        bottomLeft: Radius.circular(32),
                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 80),
                  child: ListTile(
                    title: Text(
                      responses[index]["response"]!,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white),
                  ),
                    tileColor: Colors.pinkAccent[100],
                    leading: Icon(Icons.computer,color: Colors.white,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      )
                    ),
                  ),
                ),
              ],
            );
          })),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              children: [
                SizedBox(
                    width: 340,
                    child: TextField(
                      controller: controller,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.pinkAccent[200],
                        filled: true,
                        hintText: "Enter A Message",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        )
                      ),
                    )),
                SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent[200],
                    borderRadius: BorderRadius.circular(32)),
                  child: IconButton(
                    onPressed: sendMessage,
                    icon: Icon(Icons.send),
                    color: Colors.white,
                  ),
                  ),

              ],
            ),
        )
        ],
      ),
    );
  }
}



changes in manifest and pubsec.yaml
