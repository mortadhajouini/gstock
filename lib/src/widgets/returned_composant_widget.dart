import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gstock/src/models/reservationModel.dart';
import 'package:gstock/src/models/retourModel.dart';
import 'package:gstock/src/services/reservationServices.dart';

class ReturnComposantWidget extends StatefulWidget {
  final reservation resrv;
  const ReturnComposantWidget({super.key ,required this.resrv});

  @override
  State<ReturnComposantWidget> createState() => _ReturnComposantWidgetState();
}

class _ReturnComposantWidgetState extends State<ReturnComposantWidget> {
  List<String> status = ["Intact" , "Endommagé", "Gravement endammagé"];
  List<bool> values = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
    return  Dialog(child: 
    Container( width: Get.width *0.85, height: Get.height*.35,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Text("Choisissez l'état du composant" , style: Get.textTheme.titleSmall, ),
      Column(children: List.generate(3, (index) => statusWidget(status[index], values[index], (b){
        values =List.generate(3, (index) => false);
        values[index] = true ; 
   
        setState(() {
          
        }); 
      })),),
      GestureDetector(onTap: (){
    
        if(values.any((e) => e == true)){  ReservationServer.updateReservation(reservation(id: widget.resrv.id! ,idComposant: widget.resrv.idComposant, dateEmprunt:  widget.resrv.dateEmprunt, idUser:  widget.resrv.idUser, status: 2 ,retour: RetourComposant(etat: status[values.indexWhere((element) => true)], DateRetour: Timestamp.now())));
                               Get.back();}else{Get.snackbar("Erreur", "S'il vous plait donner un état" , backgroundColor: Colors.red);}
        
      },
        child: Container(width: 200.w, height: 50.h, decoration: BoxDecoration( border: Border.all( color: Colors.greenAccent)  , borderRadius: BorderRadius.circular(100)) , child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                    const  Icon(Icons.done , color: Colors.green, ),
                                     SizedBox(width: 10.w,),
                                       Text("Valider" , style:  Theme.of(context).textTheme.bodyLarge,),
                                     ],
                                   ),),
      )
      ],
    ), ),);
  }


  Widget statusWidget(String status , bool value , Function(bool?) onChanged){
    return Row(children: [ Checkbox(value: value, onChanged: (val)=> onChanged.call(val)) , SizedBox(width: 20.w,) , Text(status)],);
  }
}