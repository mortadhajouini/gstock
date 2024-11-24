
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gstock/src/data/globals.dart';
import 'package:gstock/src/models/reservationModel.dart';

class ReservationServer 
{
   static Future <List<reservation>?> getreservationsByUser () async
  { 
    List<QueryDocumentSnapshot<reservation>> query= await reservationRef.where("idUser" , isEqualTo: currentUser!.uid).get().then((value) => value.docs);
    if(query.isNotEmpty){
    var reservation = query.map((e) => e.data());
    return reservation.toList();
   }
  return null;
  } 
  
  static Future<reservation?> createreservation (reservation reservation)  async
  {
    await reservationRef.add(reservation).then((value) =>value.update({"id" : value.id}).catchError((erreur)=> print(erreur)) );
    return null;
  }
   static Future <List<reservation>?> getreservationsByAdmin () async
  { 
    List<QueryDocumentSnapshot<reservation>>? query= await reservationRef.where("status" , isEqualTo: 0).get().then((value) => value.docs);
    if(query != null){
    var reservation = query.map((e) => e.data());
    return reservation.toList();
   }
  return null;
  } 
     static Future <List<reservation>?> getApprouvedreservationsByAdmin () async
  { 
    List<QueryDocumentSnapshot<reservation>>? query= await reservationRef.where("status" , isNotEqualTo: 0).get().then((value) => value.docs);
    if(query != null){
    var reservation = query.map((e) => e.data());
    return reservation.toList();
   }
  return null;
  } 

  static Future<void> updateReservation(reservation resrv) async{

      await reservationRef.doc(resrv.id).update(resrv.toJson()).then((value)=> 
      print("le mise a jour et secsees")).
      catchError((erreur) =>  print('Erreur lors de la mise à jour de la quantité : $erreur')) ;

  }
 

  }


