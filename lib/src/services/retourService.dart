import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gstock/src/data/globals.dart';
import 'package:gstock/src/models/retourModel.dart';

 /*class RetourServices 
{
  static Future<List<RetourComposant>?> getRetourComposant () async
  {
    List <QueryDocumentSnapshot<RetourComposant>> query = await RetourComposantRef.where("idUser",isEqualTo: currentUser!.uid).get().then((value) => value.docs)  ;
    if(query.isNotEmpty )
    {
        var retourcomposant = query.map((e) => e.data());
        return retourcomposant.toList();
    }
    return null;
  }
  static Future<RetourComposant?> createreservation (RetourComposant retourComposant)  async
  {
    await RetourComposantRef.add(retourComposant).then((value) =>value.update({"id" : value.id}).catchError((erreur)=> print(erreur)) );
    return null;
  }
 

} */