import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

ProfileUser profileFromJson(String str) => ProfileUser.fromMap(json.decode(str));

String profileToJson(ProfileUser data) => json.encode(data.toJson());
final profileRef = FirebaseFirestore.instance.collection('profile').withConverter<ProfileUser>(
      fromFirestore: (snapshot, _) => ProfileUser.fromMap(snapshot.data()!),
      toFirestore: (car, _) => car.toJson(),
    ); 

class ProfileUser 
{
  final String? uid ;
  final String nom;
  final String prenom; 
  final String numeroTelephone ;
  final String email;
  final bool isAdmin;

  ProfileUser (
    {
       this.uid,
       required this.nom, 
       required this.prenom,
       required this.numeroTelephone,
       required this.email,
       required this.isAdmin
    }
  ); 
  factory ProfileUser.fromMap(Map<String, dynamic> json) =>ProfileUser(
      uid: json['uid'] , 
      nom:json['nom'],
      prenom: json['prenom'],
      numeroTelephone: json['numeroTelephone'] ,
      email: json["email"],
      isAdmin:  json["isAdmin"]



    );
    Map<String, Object?> toJson() => {
         "uid": uid,
         "nom":nom,
         "prenom":prenom,
         "numeroTelephone" :numeroTelephone,
         "email":email,
         "isAdmin": isAdmin
        
      };

} 



    
