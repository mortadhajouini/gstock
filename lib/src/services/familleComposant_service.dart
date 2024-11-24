
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gstock/src/models/famille_composent.dart';

class FamilleComposantService{
 static Future<List<FamilleComposant>?> getfamilleComposant() async{
   List<QueryDocumentSnapshot<FamilleComposant>> query= await familleComposantRef.get().then((value) => value.docs);
   if(query.isNotEmpty){
    var famille = query.map((e) => e.data());
    return famille.toList();
   }
  return null;
  }
   static Future<List<FamilleComposant>?> createfamilleComposant(FamilleComposant familleComposant) async{
    await familleComposantRef.add(familleComposant) .then((value) => value.update( {"id": value.id}) ).catchError((e)=> print(e)) ;
    return null;
   
   }
}