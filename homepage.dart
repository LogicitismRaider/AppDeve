import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int count = 0;

  void incrementCount(){
    setState(() {
      count++;
    });
  }

  void decrementCount(){
    setState(() {
      count--;
    });
  }

  void ResetCount(){
    setState(() {
      count=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My First App"),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: ResetCount,
          child: Icon(Icons.circle),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have pushed this button this many times:",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            Text("$count",
              style: TextStyle(
                fontSize: 19,
              ),),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: incrementCount, icon: Icon(Icons.add), iconSize: 39,),
                IconButton(onPressed: decrementCount, icon: Icon(Icons.indeterminate_check_box_rounded), iconSize: 39,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
