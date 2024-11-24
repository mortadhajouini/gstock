// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gstock/src/data/globals.dart';
import 'package:gstock/src/services/loginServes.dart';
import 'package:gstock/src/utils/theme_utils.dart';
import 'package:gstock/src/views/loginScreen_views.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: double.infinity,
      color: ThemeUtils.mov,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.h,),
          Text('profile:',style: Theme.of(context).textTheme.displaySmall ,  ) ,
          SizedBox(height: 10.h,),
          Material( 
            borderRadius: BorderRadius.circular(100),
            color: ThemeUtils.mov,
            elevation: 4,
            child: Icon(Icons.account_circle_outlined, size: 130 , )),
          SizedBox(height: 20.h,),
          Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(currentUser!.nom ,  style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20) ,),
              SizedBox(width: 4.w ,),
              Text(currentUser!.prenom , style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20)), 

            ], ),
              SizedBox(height: 10.h,),
              Text(currentUser!.email ,style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20)),
              SizedBox(height:10.h,),
              Text(currentUser!.numeroTelephone ,style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20)) , 
               SizedBox(height: 80.h,) , 
                Row(
                  children: [
                    Icon(Icons.location_on), 
                    Text(" Dossic lac1", style: TextStyle(fontWeight: FontWeight.bold , 
                    ),)
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Icon(Icons.flutter_dash), 
                    SizedBox(width: 5.w,),
                    Text("Gstock", style: TextStyle(fontWeight: FontWeight.bold )) ,
                  ],
                ), 
                IconButton(onPressed: ()
                {
                  LoginService.logOut();
                  Navigator.push(context,MaterialPageRoute(builder: (context) => LoginSceenViews(),));
                } , icon:  const Icon( Icons.logout_outlined) ,  )
                
        ],
        
         
      ),
    );
  }
}