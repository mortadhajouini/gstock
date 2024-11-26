
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gstock/src/data/globals.dart';
import 'package:gstock/src/models/reservationModel.dart';
import 'package:gstock/src/services/reservationServices.dart';
import 'package:gstock/src/utils/theme_utils.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReservationAdminList extends StatefulWidget {
  const ReservationAdminList({super.key});

  @override
  State<ReservationAdminList> createState() => _ReservationAdminListState();
}

class _ReservationAdminListState extends State<ReservationAdminList> {
 List<reservation>? reservationList;

  @override
  void initState() {
    getreservation();
    super.initState();
  }

  getreservation()async{
    reservationList = await ReservationServer.getreservationsByAdmin();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:reservationList == null ? CircularProgressIndicator(): reservationList!.isEmpty ? Column(children: [Text("Vous n'avez pas de produits")],) : ListView.separated(itemBuilder: (context,index) =>
       Padding(
           padding: const EdgeInsets.only(right :8.0 , left: 8),
         child: Container(
          decoration: BoxDecoration( borderRadius: BorderRadius.circular(20) ,border: Border.all(color: reservationList![index].status == 0 ? Colors.orange : Colors.green) ),
           child:  ExpansionTile(
            shape: StadiumBorder(side: BorderSide.none),
            leading: Image.network(currentComposant!.where((element) => element.id == reservationList![index].idComposant).first.imageUrl!),
            title: Text("${userProfiles!.where((element) => element.uid == reservationList![index].idUser).first.prenom} ${userProfiles!.where((element) => element.uid == reservationList![index].idUser).first.nom}" , style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black , fontWeight: FontWeight.bold),),
              subtitle: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Text(currentComposant!.where((element) => element.id == reservationList![index].idComposant).first.nomComposant , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),),
                  Text('Status : ${reservationList![index].status == 0 ? "En attente" : "Approuvé"}'),
                  Text('Vous avez reservez 1 le :'),
                  Text(reservationList![index].dateEmprunt.toDate().toString().substring(0,10)),
                ],
                
              ),
              children:   [
               SizedBox(height: 8.h,),
                     GestureDetector(
                       child: Container(width: 200.w, height: 50.h, decoration: BoxDecoration( border: Border.all( color: Colors.greenAccent)  , borderRadius: BorderRadius.circular(100)) , child: Row(mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                        const  Icon(Icons.done , color: Colors.green, ),
                         SizedBox(width: 10.w,),
                           Text("Valider" , style:  Theme.of(context).textTheme.bodyLarge,),
                         ],
                       ),),
                     ),
                     SizedBox(height: 8.h,)
              ],
                 ),
         ),
       ), separatorBuilder: (context,index)=>SizedBox(height: 20.h,), itemCount: reservationList!.length) 
    );
  }
}

