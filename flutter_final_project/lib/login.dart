import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.pink;
    return  Scaffold(
      backgroundColor: Color.fromARGB(245, 255, 255, 255),
      body: Center(
        child: Column(mainAxisAlignment:MainAxisAlignment.center,
        children: [
           
              Padding(
                padding: const EdgeInsets.only(left: 28,top: 80, bottom: 35),
                child: Container(alignment: Alignment.topLeft,
                  child: Icon(Icons.arrow_back_ios_new_sharp,
                  color: color,
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
                    prefixIcon: Icon(Icons.email, color: color,),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: color)
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
                    focusColor: color ,
                    prefixIcon: Icon(Icons.lock_outline, color: color,),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    
                    borderSide: BorderSide(color: color),
                  ),
                  )
                ),
              ),
              SizedBox(height: 17,),
              Transform.scale(scale: 1.3,
                child: ElevatedButton(onPressed: (){}, 
                child: Text("Login",
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600),),
                 style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                ),),
              ),
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
                    color: color,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),))
                ],
              ),
              Spacer(),
        ],),),
    );
  }
}