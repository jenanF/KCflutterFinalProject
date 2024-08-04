import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(245, 255, 255, 255),
      body: Center(
        child: Column(mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/black.png",
              height: 200,
              width: 200,),
              Padding(
                padding: const EdgeInsets.only(left:20, right: 20,top:16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    hintStyle: TextStyle(fontSize: 11),
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email, color: Colors.pink,),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  )
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left:20, right: 20,top:16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    hintStyle: TextStyle(fontSize: 11),
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.pink,),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  )
                ),
              ),
              ElevatedButton(onPressed: (){}, child: Text("login")),
              Text("new here?")
        ],),),
    );
  }
}