import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.lightBlue,
      ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           SizedBox(
             width: 350,
             child: TextFormField(
               controller: username,
               decoration: InputDecoration(
                 label: Text("Username"),
                 border: OutlineInputBorder()
               ),
             ),
           ),
           SizedBox(
             height: 20,
           ),
           SizedBox(
             width: 350,
             child: TextFormField(
               controller: password,
               decoration: InputDecoration(
                 label: Text("Password"),
                 border: OutlineInputBorder()
               ),
             ),
           ),
           SizedBox(
             height: 20,
           ),
           ElevatedButton(
             onPressed: (){
               //print("Username: ${username.text}\nPassword: ${password.text}");
               if (username.text =="kjc" && password.text == "pass1234")
               {
                 //print("Login Success");
                 showDialog(context: context, builder: (context) => AlertDialog(
                   title: Text("Login Successful"),
                   content: Text("Entering the App"),
                   actions: [
                     ElevatedButton(onPressed: (){
                       Navigator.pop(context);}, child: Text("OK"))
               ],
                 ));
               }
               else{
                 //print("Login Fail");
                 showDialog(context: context, builder: (context) => AlertDialog(
                   title: Text("Login Failed"),
                   content: Text("Check your Username and Password"),
                   actions: [
                     ElevatedButton(onPressed: (){
                       Navigator.pop(context);
                     }, child: Text("OK"))
                   ],
                 ));
               }
             },
             child: Text("Login"),
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.lightGreen
             ),
           )
         ],
       ),
     ),
    );
  }
}
