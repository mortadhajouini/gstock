import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

FamilleComposant carFromJson(String str) => FamilleComposant.fromMap(json.decode(str));

String familleComposantToJson(FamilleComposant data) => json.encode(data.toJson());
final familleComposantRef = FirebaseFirestore.instance.collection('famille_composant').withConverter<FamilleComposant>(
      fromFirestore: (snapshot, _) => FamilleComposant.fromMap(snapshot.data()!),
      toFirestore: (car, _) => car.toJson(),
    );

class FamilleComposant {
  FamilleComposant(
      {this.id,
      required this.typeComposant,
      required this.imageUrl
   });

  final String? id;
  final String typeComposant;
  final String imageUrl;


  factory FamilleComposant.fromMap(Map<String, dynamic> json) => FamilleComposant(
      id: json["id"],
      typeComposant: json["type_composant"] as String,
      imageUrl: json["image_url"] as String,
  );

  Map<String, Object?> toJson() => {
        "id": id,
        "type_composant": typeComposant,
        "image_url": imageUrl,

      };

  
}
