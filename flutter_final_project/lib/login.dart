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
           
              Padding(
                padding: const EdgeInsets.only(left: 28,top: 80, bottom: 35),
                child: Container(alignment: Alignment.topLeft,
                  child: Icon(Icons.arrow_back_ios_new_sharp,
                  color: Colors.pink,
                  size: 50,),
                ),
              ),
              
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
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.pink)
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
                    focusColor: Colors.pink ,
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.pink,),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  )
                ),
              ),
              SizedBox(height: 17,),
              ElevatedButton(onPressed: (){}, 
              child: Text("login",
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400),),
               style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
              ),),
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("new here?",
                  style: TextStyle(
                    color: Colors.grey
                  ),),
                  TextButton(onPressed: (){}, 
                  child: Text("Sign up",
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),))
                ],
              ),
              Spacer(),
        ],),),
    );
  }
}