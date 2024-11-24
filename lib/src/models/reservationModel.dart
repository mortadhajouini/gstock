import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:gstock/src/models/retourModel.dart';

// ignore: camel_case_types
class reservation 
{
   final String ? id ;  
   final String idComposant;
   final String idUser ; 
   final Timestamp dateEmprunt; 
   final  int  status;
   RetourComposant? retour;


   reservation ({
    this.id,
    required this.idComposant , 
    required this.dateEmprunt, 
    required this.idUser,
    required this.status,
    this.retour
   });
    factory reservation.fromMap(Map<String, dynamic> json) => reservation(
      id: json["id"],
      idComposant: json["idComposant"] as String,
      idUser: json["idUser"] as String,
      dateEmprunt:json["dateEmprunt"] as Timestamp ,
      status: json["status"] as int , 
      retour: json["retour"]== null ? null :  RetourComposant.fromMap(json["retour"])

  );

  Map<String, Object?> toJson() => {
        "id": id,
        "idComposant": idComposant,
        "idUser": idUser,
        "dateEmprunt": dateEmprunt,
        "status": status,
        "retour" : retour?.tojson()
};


} 
reservation reservationFromJson(String str) => reservation.fromMap(json.decode(str));

String reservationToJson(reservation data) => json.encode(data.toJson());
final reservationRef = FirebaseFirestore.instance.collection('reservation').withConverter<reservation>(
      fromFirestore: (snapshot, _) => reservation.fromMap(snapshot.data()!),
      toFirestore: (car, _) => car.toJson(),
    );
    
