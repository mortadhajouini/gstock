
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gstock/src/utils/theme_utils.dart';
import 'package:gstock/src/views/loginScreen_views.dart';
import 'package:gstock/src/widgets/button_widget.dart';

class welcomeScreen extends StatelessWidget 
{
  const welcomeScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          
            
          Positioned(
            top: 0,
            child: Container( 
            decoration:  const BoxDecoration(color:ThemeUtils.secondaryGreenBlue , borderRadius: BorderRadius.only(bottomRight: Radius.circular(200) , bottomLeft: Radius.circular(200))),
            width:MediaQuery.of(context).size.width,
              height: 500.h,   
            ),
          ),
           Positioned(
            top: 70.h,
            left: 10,
            right: 10,
            child: Text("welcome to gstock", style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize:48.sp,fontWeight: FontWeight.bold ),
             )),
          Positioned( top: 200.h    , child: Image.asset("assets/images/nes.png")
           ),

           Positioned(
            left: 10,
            right: 10,
            bottom: 50.h,
            child:BottomNavigationButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: ( context ) => LoginSceenViews()  ));
            }, text: "Commencer")
          ), 

         
        ],
      ), );
      
  } }