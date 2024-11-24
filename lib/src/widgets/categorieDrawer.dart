import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gstock/src/models/famille_composent.dart';
import 'package:gstock/src/services/familleComposant_service.dart';
import 'package:gstock/src/widgets/button_widget.dart';
import 'package:gstock/src/widgets/textfield_widget.dart';

// ignore: must_be_immutable
class CategorieDrewer extends StatelessWidget {
   CategorieDrewer({super.key});
  TextEditingController  categoriecontrollor = TextEditingController() ; 
  TextEditingController imagecategoriecontroller = TextEditingController() ; 

  @override
  Widget build(BuildContext context) {
    return Container ( 
      height: 400.h,
      
      child: Column( 
        children: [ 
          Text("ajouter un categorie !" ,style: Theme.of(context).textTheme.displaySmall) ,
          SizedBox(height: 30.h,) , 
            TextFieldWidget(label:"type categorie ", hint: "type categorie", controller: categoriecontrollor) ,
            SizedBox(height: 20.h,),
            TextFieldWidget(label: "imageUrl ", hint: "imageUrl ", controller: imagecategoriecontroller), 
            SizedBox(height: 30.h ,) ,
            Row( crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                  BottomNavigationButton(
                                    width: 100 .w,
                                    height: 50.h,
                                    onPressed: (){
                                   
                                    Navigator.pop(context);
                                      },
                                   text:'annuler'),
                                   SizedBox(height: 20.h,),
                                   BottomNavigationButton(onPressed: () async{ 
                                    await FamilleComposantService.createfamilleComposant(FamilleComposant(typeComposant: categoriecontrollor.text, imageUrl: imagecategoriecontroller.text) );
                                     Navigator.pop(context);

                                   }, text:"Ajouter" ,
                                   height: 50.h,
                                   width: 100.w,)
                                   
                                ],)
            


        ],
      ),
    );
  }
}