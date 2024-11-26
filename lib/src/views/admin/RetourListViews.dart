
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gstock/src/data/globals.dart';
import 'package:gstock/src/models/reservationModel.dart';
import 'package:gstock/src/services/reservationServices.dart';
import 'package:gstock/src/utils/theme_utils.dart';
import 'package:gstock/src/widgets/returned_composant_widget.dart';

class RetourList extends StatefulWidget {
  const RetourList({super.key});

  @override
  State<RetourList> createState() => _RetourListState();
}

class _RetourListState extends State<RetourList> {
List<reservation>? reservationList;
List<reservation>? approuvedreservationList;
List<reservation>? returnedreservationList;

  @override
  void initState() {
    getreservation();
    super.initState();
  }

  getreservation()async{
    reservationList = await ReservationServer.getApprouvedreservationsByAdmin();
    if(reservationList != null){
      approuvedreservationList = reservationList!.where((element) => element.status == 1,).toList();
      returnedreservationList =reservationList!.where((element) => element.status == 2,).toList();
    }
    
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          SizedBox(height: 20.h,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Liste Des Reservation Approuvé :' , style: Get.textTheme.titleMedium!.copyWith(color: Colors.black),),
          ),
               SizedBox(height: 10.h,),
          reservationList == null ? CircularProgressIndicator(): approuvedreservationList!.isEmpty ?
         Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                width: Get.width*0.85,
                height: 250.h,
                 decoration: BoxDecoration(border: Border.all(color: ThemeUtils.secondaryGreenBlue , width: 2) ,borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                
                Image.asset('assets/images/urban-line-no-data-found.png' , height: 150,),
                Text("Vous n'avez pas de produits")],)),
             ],
           ) :
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                width: Get.width*.9,
                decoration: BoxDecoration(border: Border.all(color: ThemeUtils.secondaryGreenBlue , width: 2) ,borderRadius: BorderRadius.circular(20)),
                 child: Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: ListView.separated(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()), 
                    itemBuilder: (context,index) =>
                            Padding(
                     padding: const EdgeInsets.only(right :8.0 , left: 8),
                   child: Container(
                    decoration: BoxDecoration( borderRadius: BorderRadius.circular(20) ,border: Border.all(color: approuvedreservationList![index].status == 1 ? Colors.orange : Colors.green) ),
                     child:  ExpansionTile(
                      shape: StadiumBorder(side: BorderSide.none),
                      leading: Image.network(currentComposant!.where((element) => element.id == approuvedreservationList![index].idComposant).first.imageUrl!),
                      title: Text("${userProfiles!.where((element) => element.uid == approuvedreservationList![index].idUser).first.prenom} ${userProfiles!.where((element) => element.uid == approuvedreservationList![index].idUser).first.nom}" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black , fontWeight: FontWeight.bold),),
                        subtitle: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            Text(currentComposant!.where((element) => element.id == approuvedreservationList![index].idComposant).first.nomComposant , style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black),),
                           const Text('Status : Approuvé'),

                            Text(approuvedreservationList![index].dateEmprunt.toDate().toString().substring(0,10)),
                          ],
                          
                        ),
                        children:   [
                         SizedBox(height: 8.h,),
                               GestureDetector(
                                onTap: ()async =>  Get.dialog(ReturnComposantWidget(resrv:approuvedreservationList![index] ,)).then((value) => getreservation()),
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
                            ), separatorBuilder: (context,index)=>SizedBox(height: 20.h,), itemCount: approuvedreservationList!.length),
                 ),
               ),
             ],
           ),
                SizedBox(height: 20.h,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Liste Des Composants Retourné :' , style: Get.textTheme.titleMedium!.copyWith(color: Colors.black),),
          ),
               SizedBox(height: 10.h,),
                 reservationList == null ? CircularProgressIndicator(): returnedreservationList!.isEmpty ?
           Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                width: Get.width*0.85,
                height: 250.h,
                 decoration: BoxDecoration(border: Border.all(color: ThemeUtils.secondaryGreenBlue , width: 2) ,borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                
                Image.asset('assets/images/urban-line-no-data-found.png' , height: 150,),
                Text("Vous n'avez pas de produits")],)),
             ],
           ) :
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                width: Get.width*.9,
                decoration: BoxDecoration(border: Border.all(color: ThemeUtils.secondaryGreenBlue , width: 2) ,borderRadius: BorderRadius.circular(20)),
                 child: Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: ListView.separated(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()), 
                    itemBuilder: (context,index) =>
                            Padding(
                     padding: const EdgeInsets.only(right :8.0 , left: 8),
                   child: Container(
                    decoration: BoxDecoration( borderRadius: BorderRadius.circular(20) ,border: Border.all(color: returnedreservationList![index].status == 0 ? Colors.orange : Colors.green) ),
                     child:  ListTile(
                      shape: StadiumBorder(side: BorderSide.none),
                     /* leading: Image.network(currentComposant!.where((element) => element.id == returnedreservationList![index].idComposant).first.imageUrl!),*/
                      title: Text("${userProfiles!.where((element) => element.uid == returnedreservationList![index].idUser).first.prenom} ${userProfiles!.where((element) => element.uid == returnedreservationList![index].idUser).first.nom}" , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black , fontWeight: FontWeight.bold),),
                        subtitle: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            Text(currentComposant!.where((element) => element.id == returnedreservationList![index].idComposant).first.nomComposant , style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black),),
                            Text('Etat : ${returnedreservationList![index].retour!.etat}' , style: Get.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold , color: Colors.red) ,),

                            Text( "Date de réservation:"+ returnedreservationList![index].dateEmprunt.toDate().toString().substring(0,10)),
                              Text("Date de retour:"+ returnedreservationList![index].retour!.DateRetour.toDate().toString().substring(0,10)),
                          ],
                          
                        ),
                   
                           ),
                   ),
                            ), separatorBuilder: (context,index)=>SizedBox(height: 20.h,), itemCount: returnedreservationList!.length),
                 ),
               ),
             ],
           ),
        ]
      ) ,
      
    );
  }
}