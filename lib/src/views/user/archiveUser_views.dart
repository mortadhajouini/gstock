import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gstock/src/data/globals.dart';
import 'package:gstock/src/models/reservationModel.dart';
import 'package:gstock/src/services/reservationServices.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ArchiveUser extends StatefulWidget {
  const ArchiveUser({super.key});

  @override
  State<ArchiveUser> createState() => _ArchiveUser();
}

class _ArchiveUser extends State<ArchiveUser> {
  
  List<reservation>? reservationList;
  
  @override
  void initState() {
    getreservation();
    super.initState();
  }

  getreservation()async{
    List<reservation>? allresrvation =await ReservationServer.getreservationsByUser();
    if(allresrvation!= null)
    reservationList =  allresrvation!.where((element) => element.status != 2,).toList();
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
            title: Text(currentComposant!.where((element) => element.id == reservationList![index].idComposant).first.nomComposant , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),),
              subtitle: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Status : ${reservationList![index].status == 0 ? "En attente" :   "Approuvé"}'),
                  Text('Vous avez reservez 1 le :'),
                  Text(reservationList![index].dateEmprunt.toDate().toString().substring(0,10)),
                ],
                
              ),
              children:   [
               reservationList![index].status ==0 ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container( decoration: BoxDecoration(  border: Border.all(color: Colors.pink) , borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: QrImageView(
                      data:  reservationList![index].id!,
                                    version: QrVersions.auto,
                      size: 120.0,
                       ),
                    ),
                  ),
                ) : const SizedBox(),
              ],
                 ),
         ),
       ), separatorBuilder: (context,index)=>SizedBox(height: 20.h,), itemCount: reservationList!.length) 
    );
  }
}