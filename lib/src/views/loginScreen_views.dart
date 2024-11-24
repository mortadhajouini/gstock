
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gstock/src/data/globals.dart';
import 'package:gstock/src/models/profileModel.dart';
import 'package:gstock/src/utils/theme_utils.dart';
import 'package:gstock/src/views/admin/Home_views.dart';
import 'package:gstock/src/views/registerScreen_views.dart';
import 'package:gstock/src/views/user/mainUserViews.dart';
import 'package:gstock/src/widgets/button_widget.dart';
import 'package:gstock/src/widgets/textfield_widget.dart';

class LoginSceenViews extends StatefulWidget 
{

 const  LoginSceenViews({super.key}); 

  @override
  State<LoginSceenViews> createState() => _LoginSceenViewsState();
}

class _LoginSceenViewsState extends State<LoginSceenViews> {
  final _auth = FirebaseAuth.instance;
  bool ispassword = false;

  TextEditingController emailController =TextEditingController();

  TextEditingController passWordController = TextEditingController() ;
  

  void loginUser(BuildContext context) async
  {

   try {
       await _auth.signInWithEmailAndPassword(email: emailController.text, password: passWordController.text);
       if(_auth.currentUser != null) {
       List<QueryDocumentSnapshot<ProfileUser>> query= await profileRef.where('uid',isEqualTo: _auth.currentUser!.uid).get().then((value) => value.docs);
      if(query.isNotEmpty){
        Get.snackbar("Succees " , "login successful" , backgroundColor: Colors.green);
         currentUser = query.first.data();
         if(currentUser!.isAdmin == true)
         {Navigator.push(context,MaterialPageRoute(builder: (context) => homeScreen()  ));}
         else {
          Navigator.push(context,MaterialPageRoute(builder: (context) => mainUser()));
        }
           
         print(currentUser!.toJson());
         
      }
      
       }

    }
    // ignore: unused_catch_clause
    on FirebaseAuthException catch(erreur)
    {
      // ignore: avoid_print
      print("not found");
      Get.snackbar("Ereeur de connection ", "votre compte est introvable check u're compte " , backgroundColor: Colors.red);
    }
    
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold( 
  /*     backgroundColor: Color(0xffD9D9D9), */
      body:  SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h,),
             Text("S'Authentifier Maintenant !" ,style: Theme.of(context).textTheme.displaySmall, ),
             Center(
             child: Image.asset("assets/images/login_asset.png" ,height: 250.h,)
             ),
             SizedBox(height: 30.h,),
             TextFieldWidget(label: "Email", hint: "Email", controller: emailController),
                SizedBox(height: 20.h,),
             TextFieldWidget(label: "Mot de passe", hint: "Mot de passe", controller: passWordController, hidden: ispassword, suffixIcon:ispassword ?  Icons.visibility : Icons.visibility_off, onTap: (){
              setState(() {
                ispassword=!ispassword;
              });
             } , ) 
             , BottomNavigationButton(onPressed:()=> loginUser(context)

             , text: "S'authentifier") ,
              Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text("Vous n'avez pas de compte encore?" , style: Theme.of(context).textTheme.bodyMedium,),
                  GestureDetector(
                    onTap: () =>   Navigator.push(context,MaterialPageRoute(builder:   (context) => RegisterScreen()  )),
                    child: Text("S'Inscrire", style:  Theme.of(context).textTheme.bodyMedium!.copyWith(color: ThemeUtils.primaryBlue, decoration: TextDecoration.underline),)),

                ],
              )
          ],
           

        ),
      ),
       
     );
  }
}