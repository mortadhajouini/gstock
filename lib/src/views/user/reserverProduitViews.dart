

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gstock/src/data/globals.dart';
import 'package:gstock/src/models/composant.dart';
import 'package:gstock/src/models/reservationModel.dart';
import 'package:gstock/src/services/composantServes.dart';
import 'package:gstock/src/services/reservationServices.dart';
import 'package:gstock/src/utils/theme_utils.dart';
import 'package:gstock/src/widgets/button_widget.dart';

class ReserverProduit extends StatefulWidget {
  final Composant composant; 
  const ReserverProduit({super.key, required this.composant});

  @override
  State<ReserverProduit> createState() => _ReserverProduitState();
}

class _ReserverProduitState extends State<ReserverProduit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h,),
            Text("voila une view totale", style: Theme.of(context).textTheme.displaySmall,),
            SizedBox(height: 20.h,),
        
            Center(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                decoration: BoxDecoration(border: Border.all(color: ThemeUtils.primaryBlue) , borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Image.network(widget.composant.imageUrl!),
                      SizedBox(height: 20.h,),
                      Row( mainAxisAlignment : MainAxisAlignment.spaceBetween, children: [
                       const Text("Nom du composant :" , style: TextStyle(
                          fontWeight: FontWeight.bold
                        ), ),
                        Text(widget.composant.nomComposant)
                      ],),
                      SizedBox(height: 10.h,) ,
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                         const Text("quantité disponible :" , style: TextStyle(fontWeight: FontWeight.bold), ),
                        Text( "${widget.composant.quantiteComposant}"),
                      ],),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          const Text("Descriptin de categorie :", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
                        ],
                      ),
                       SizedBox(height: 10.h,),
                       Text(widget.composant.description, textAlign: TextAlign.justify,  ),
                    ],
                  ),
                ) 
              ),
              
            ) ,
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BottomNavigationButton(width: 100.w,height: 50.h, onPressed: () {
                   Navigator.pop(context) ;
                } , text: "Annuler") , 
                BottomNavigationButton(onPressed: (){ 
                  ReservationServer.createreservation(reservation(idComposant: widget.composant.id.toString(), dateEmprunt:Timestamp.now(), idUser: currentUser!.uid.toString(), status: 0) );
                    ComposantService.updatecomposant(Composant(id:widget.composant.id, nomComposant: widget.composant.nomComposant, dateAquisition: widget.composant.dateAquisition, typeComposant: widget.composant.typeComposant, quantiteComposant: widget.composant.quantiteComposant -1, imageUrl: widget.composant.imageUrl, description: widget.composant.description));
                  Navigator.pop(context) ;
                  setState(() {
                    
                  });
        
                }, text:"Reserver" ,width: 100 .w,
                                      height: 50.h, )
              ],
            )
          ],
        ),
      ),
      
    );
  }
}