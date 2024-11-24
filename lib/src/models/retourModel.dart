import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class RetourComposant 
{

  final String  etat;
  final Timestamp DateRetour; 


  RetourComposant({

    required this.etat,
    required this.DateRetour,

  });
  factory RetourComposant.fromMap(Map<String, dynamic> json) => RetourComposant(

      DateRetour:json["DateRetour"] as Timestamp ,
      etat: json["etat"] as String , 

  );

  Map<String, Object?> tojson() => {

        "DateRetour": DateRetour,
        "etat": etat,
};






}
RetourComposant retourComposantFromJson (String str) => RetourComposant.fromMap(json.decode(str));
String retourComposantToJson (RetourComposant data) => json.encode(data.tojson()) ; 
