import 'package:flutter/material.dart';
import 'package:shared_proferences_2/pages/login_page.dart';

import '../modul/user_modul.dart';
import '../services/pref_services.dart';


class HomePage extends StatefulWidget {
  static const String id = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
     body: Column(
       children: [
        SizedBox(height: 100,),

         Center(
           child: Container(
             height: 200,
             width: 200,
             decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage('assets/images/img.jpeg'),fit: BoxFit.cover)
             ),
           ),
         ),
        SizedBox(height: 10,),
         Text('Welcome back!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
         SizedBox(height: 15,),
         Text('Log in to your existant account of Q Allure',style: TextStyle(fontWeight:FontWeight.bold,fontSize:15,color: Colors.grey[400]),),
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
                   hintText: 'Jonewilliasm@gmail.com',hintStyle: TextStyle(color: Colors.blue,fontWeight: FontWeight.w800)
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
         SizedBox(height: 10,),
         Row(crossAxisAlignment: CrossAxisAlignment.end,
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Padding(
               padding: const EdgeInsets.only(top:10,right: 28.0),
               child: Text('Forgot Password?'),
             )
           ],
         ),
         SizedBox(height: 10,),
         Container(
           height: 55,
           width: 200,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.blue[900]),
           child: Center(child: TextButton(onPressed: Dologin,
           child: Text('LOG IN ',style: TextStyle(fontSize:17,color: Colors.white,fontWeight: FontWeight.bold),),
           )),
         ),
         SizedBox(height: 40,),
         Text('Or connect using',style: TextStyle(color: Colors.grey[400]),),
         SizedBox(height: 20,),
         Row(
           children: [
             Expanded(child: Container(height: 40,
               margin: EdgeInsets.only(left: 50),

               decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.blue[900],),
               child: Center(
                 child: Row(
                   children: [SizedBox(width: 20,),
                     Text('f',style: TextStyle(fontSize:17,color: Colors.white,fontWeight: FontWeight.bold),),
                     SizedBox(width: 10,),
                     Text('Facebook',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                   ],
                 ),
               ),
             )),
             SizedBox(width: 20,),
             Expanded(child: Container(height: 40,
               margin: EdgeInsets.only(right: 50),
               decoration: BoxDecoration(color: Colors.red[500],borderRadius: BorderRadius.circular(5)),
         child: Center(
           child: Row(
             children: [SizedBox(width: 20,),
               Text('G',style: TextStyle(fontSize:17,color: Colors.white,fontWeight: FontWeight.bold),),
               SizedBox(width: 10,),
               Text('Google',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
             ],
           ),
         ),
             ))
         ],),
         SizedBox(height: 40,),
         Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
              Text('Don`t have an account?'),
          TextButton(onPressed: (){
            Navigator.pushNamed(context, LoginPage.id);
          }, child:Text('Sign Up',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
          )
           ],
         )
       ],
     ),

    );
  }
}
