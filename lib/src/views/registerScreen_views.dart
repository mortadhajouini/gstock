
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gstock/src/data/globals.dart';
import 'package:gstock/src/models/profileModel.dart';
import 'package:gstock/src/services/loginServes.dart';
import 'package:gstock/src/utils/theme_utils.dart';
import 'package:gstock/src/views/loginScreen_views.dart';
import 'package:gstock/src/widgets/button_widget.dart';
import 'package:gstock/src/widgets/textfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  
   RegisterScreen({super.key}); 

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   bool ispassword=false;
   bool confirmerpass= false;
   var passWordController =TextEditingController();
   var confirmerpasscontroller = TextEditingController();
   var telephoneController=TextEditingController();
   var nomcontroller =TextEditingController(); 
   var prenomController = TextEditingController();
   var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column( mainAxisAlignment: MainAxisAlignment.start ,
        crossAxisAlignment: CrossAxisAlignment.center ,
          children: [
            SizedBox( height: 50.h ), 
            Text("Créer un compte Maintenant ! " , style: Theme.of(context).textTheme.displaySmall,),
            SizedBox(height: 30.h,) , 
            Center(child: TextFieldWidget(label: "Nom" , hint:'Nom', controller: nomcontroller )) ,
            SizedBox(height: 20.h,),
            TextFieldWidget(label:"prénom", hint:"prénom", controller: prenomController),
            SizedBox(height: 20.h,),
            TextFieldWidget(label:"numéro téléphone ", hint:"téléphone", controller:telephoneController ,inputType: TextInputType.phone, ) , 
            SizedBox(height: 20.h,),
            TextFieldWidget(label: "adresse email" , hint: "adresse email" , controller: emailController,inputType:TextInputType.emailAddress,) , 
            SizedBox(height: 20.h,),
            TextFieldWidget(label: "mot de passe ", hint: "mot de passe", controller:passWordController, hidden: ispassword, suffixIcon:ispassword ?  Icons.visibility : Icons.visibility_off, 
             onTap:(){ setState(() {
              ispassword=! ispassword;
            });},), 
            SizedBox(height: 20.h,) , 
            TextFieldWidget(label: " confirmer mot de passe ", hint: " confirmer mot de passe", controller:confirmerpasscontroller, hidden: confirmerpass, suffixIcon: confirmerpass ?  Icons.visibility : Icons.visibility_off,
            onTap: ()
            {
              setState(() {
                confirmerpass =!confirmerpass;
              });
            },
            validator: (val) {
              if(val != passWordController.text )
              {
                return "votre mot de passe  incorrecte";
              }
              return null;
            },
             ),
            BottomNavigationButton(onPressed: ()async
            {
            User? firenaseUser= await  LoginService.registerEmailPassword(emailController.text, passWordController.text);
            if(firenaseUser !=null){
           await   LoginService.createProfile(ProfileUser(uid: firenaseUser.uid, nom: nomcontroller.text, prenom: prenomController.text, numeroTelephone: telephoneController.text, email: emailController.text, isAdmin: false));
             if(currentUser != null){
              Navigator.push(context,MaterialPageRoute(builder: (context) => LoginSceenViews()  ));
             }

            }
            Get.snackbar("Sucsees register ", "votre compte a été creee avec sucsses");
            } , text: "S'Inscrire"),
            Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text("tu a un compte ?" , style: Theme.of(context).textTheme.bodyMedium,),
                  GestureDetector(
                    onTap: () =>   Navigator.push(context,MaterialPageRoute(builder:   (context) => LoginSceenViews()  )),
                    child: Text("Seconnecter", style:  Theme.of(context).textTheme.bodyMedium!.copyWith(color: ThemeUtils.primaryBlue, decoration: TextDecoration.underline),)),

                ],

              )

           
        ],),
      )
    );
  }
}