import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

Composant composantFromJson(String str) => Composant.fromMap(json.decode(str));

String composantToJson(Composant data) => json.encode(data.toJson());
final composantRef = FirebaseFirestore.instance.collection('composant').withConverter<Composant>(
      fromFirestore: (snapshot, _) => Composant.fromMap(snapshot.data()!),
      toFirestore: (composant, _) => composant.toJson(),
    );

class Composant {
  Composant(
      {this.id, 
       required this.nomComposant,
       required this.dateAquisition,
       required this.typeComposant ,
       required this.quantiteComposant,
        required this.imageUrl,
        required this.description,
       
      });

  final String? id;
  final String nomComposant ; 
  final String typeComposant ; 
  final Timestamp? dateAquisition;
  final String? imageUrl;
  final int quantiteComposant ;
  final String description;

  factory Composant.fromMap(Map<String, dynamic> json) => Composant(
      id: json["id"],
      nomComposant: json["nom_composant"]! as String,
      dateAquisition:json["dateAquisition"]! as Timestamp,
      typeComposant: json["type_composant"] ! as String ,
      quantiteComposant:  json["quantite_composant"],
      imageUrl : json["image_url"],
      description : json["description"]! as String,

      
      );

  Map<String, Object?> toJson() => {
        "id": id,
        "nom_composant":nomComposant,
        "dateAquisition":dateAquisition,
        "type_composant":typeComposant,
        "quantite_composant":quantiteComposant,
        "image_url":imageUrl,
        "description":description ,
      };
}
