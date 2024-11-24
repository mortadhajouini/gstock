import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gstock/src/views/welcomScreen_views.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    timescreen(); 
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  
          Column(
             mainAxisAlignment: MainAxisAlignment.center ,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("gstock", style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize:48.sp,fontWeight: FontWeight.bold ),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
              
              Center( child: Image.asset('assets/images/rajil.png',width: 150.w,) ),
                            SizedBox(height: 80.h,),
                            const Center( child:LinearProgressIndicator(),)
             
            ],
          ),
        
      );
    
  }
  Future timescreen ()
  async {
    Future.delayed( const Duration(milliseconds: 2000 )).then((value) => Navigator.push(context,MaterialPageRoute(builder:(context)=> welcomeScreen())));
  }
}