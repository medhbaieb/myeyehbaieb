
import 'package:about/login.dart';
import 'package:about/navbar.dart';
import 'package:about/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  //with instance AuthController would be able to the app everywhere
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
 
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    //worker function
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    //if user not login
    if (user == null) {
      print("login page");
      Get.offAll(() => SignupPage());

    }
    
    else{
      Get.offAll(() => NavBar(email:user.email!));
      
    }
  }
  
   void register(String email, password)async{
     try{
     await  auth.createUserWithEmailAndPassword(email: email, password: password);
     //snackbar
     Get.snackbar("About Login", "Login message",
           backgroundColor: Color.fromARGB(255, 95, 188, 243),
           snackPosition: SnackPosition.BOTTOM,
           titleText: Text(
             "Login Successful",
             style: TextStyle(
                 color: Colors.white
             ),
           ),
           
       );
     }catch(e){
        Get.snackbar("About User", "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(
              color: Colors.white
            ),
          ),
          messageText: Text("$email,$password \n"+
            e.toString(),
              style: TextStyle(
                  color: Colors.white
              )
          )
        );
     }
   }
   void login(String email, password)async{
     try{
       await  auth.signInWithEmailAndPassword(email: email, password: password);
     }catch(e){
       Get.snackbar("About Login", "Login message",
           backgroundColor: Colors.redAccent,
           snackPosition: SnackPosition.BOTTOM,
           titleText: Text(
             "Login failed",
             style: TextStyle(
                 color: Colors.white
             ),
           ),
           
           messageText: Text("$email,$password \n"+
               e.toString(),
               style: TextStyle(
                   color: Colors.white
               )
           )
       );
     }
   }
   void logOut()async{
     await auth.signOut();
   }
}
