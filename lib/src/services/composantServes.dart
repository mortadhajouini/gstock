import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gstock/src/models/composant.dart';

class ComposantService
{
  static Future<List<Composant>?> getComposant() async{
   List<QueryDocumentSnapshot<Composant>> query= await composantRef.get().then((value) => value.docs);
   if(query.isNotEmpty){
    var composant = query.map((xcomposant) => xcomposant.data());
    return composant.toList();
   }
  return null;
  }
  
  static Future <Composant?> createcomposant( Composant composant)async
  {
      // ignore: avoid_print
      await composantRef.add(composant).then((value) => value.update( {"id": value.id}) ).catchError((e)=> print(e));
      return null;
  }
  static Future<Composant?> updatecomposant (Composant composant) async
  {
    await composantRef.doc(composant.id).update(composant.toJson()).then((value)=> print("le mise a jour et secsees")).catchError((erreur) =>  print('Erreur lors de la mise à jour de la quantité : $erreur')) ;
    return null;
  }
    static Future<void> deleteComposant(Composant composant) async {
    await composantRef.doc(composant.id).delete().catchError((error) {
      print('Error deleting composant: $error');
    });
  }
  
}