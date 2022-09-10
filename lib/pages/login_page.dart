import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_proferences_2/modul/user_modul.dart';
import 'package:shared_proferences_2/pages/home_page.dart';

import '../services/pref_services.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? myname;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Dologin(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user = User.from(password: password,email: email);
    Prefs.storeUser(user);
    Prefs.loadUser().then((value) => {
      print(user.email)
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_rounded,color: Colors.black,),
      ),
      body: Column(
        children: [SizedBox(height: 30,),
          Center(
            child: Text('Let`s Get Started!',style: TextStyle(color:Colors.black,fontWeight: FontWeight.w800,fontSize: 25),),
          ),
          SizedBox(height: 15,),
          Text('Create an account to Q Allure to get all features',style: TextStyle(color: Colors.grey),),
          SizedBox(height: 40,),
          Container(height: 65,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(55),color: Colors.white,
                border: Border.all(
                    color: Colors.blue,width: 2
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none,
                      prefixIcon: Icon(Icons.person_outline,color: Colors.blue,),
                      hintText: 'Jhone Williams',hintStyle: TextStyle(color: Colors.blue,fontWeight: FontWeight.w800)
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(height: 65,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(55),color: Colors.white,

            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none,
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.grey[400],) ,
                      hintText: 'Email',hintStyle: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.w600)
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(height: 65,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(55),color: Colors.white,

            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none,
                      prefixIcon: Icon(Icons.phone_android_outlined,color: Colors.grey[400],) ,
                      hintText: 'Phone',hintStyle: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.w600)
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(height: 65,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(55),color: Colors.white,

            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock_open,color: Colors.grey[400],) ,
                      hintText: 'Password',hintStyle: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.w600)
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(height: 65,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(55),color: Colors.white,

            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock_open,color: Colors.grey[400],) ,
                      hintText: 'Confirm Password',hintStyle: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.w600)
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Center(
            child: Container(margin: EdgeInsets.only(left: 80,right: 80),
              height: 65,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.blue[800]),
              child: Center(child: TextButton(onPressed: Dologin,child: Text('CREATE',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800),),)),
            ),
          ),
          SizedBox(height: 50,),

          Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('Already have an account?',style: TextStyle(fontWeight: FontWeight.w500),),),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, HomePage.id);
              },
                  child: Text('Login here',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700),)
              )
            ],
          )

        ],
      ),
    );
  }
}
