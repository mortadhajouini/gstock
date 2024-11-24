import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gstock/src/data/globals.dart';
import 'package:gstock/src/models/profileModel.dart';

class LoginService {
static  final _auth = FirebaseAuth.instance;
static  Future<User?> loginEmailPassword(String email ,String password )
async {
   try{
      _auth.signInWithEmailAndPassword(email: email, password: password);

  } on FirebaseAuthException catch (erreur)
     {
      print(erreur.message);

  }
  return _auth.currentUser;
  
}
static Future <void> logOut () async{
  await _auth.signOut();
  
}

 
// ignore: body_might_complete_normally_nullable
static Future<User?> registerEmailPassword(String email ,String password )
async {
   try{
   return   _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => value.user);

  } on FirebaseAuthException catch (erreur)
     {
      print(erreur.message);

  }

  
}

static Future<ProfileUser?> getProfile(String uid)async{
  List<QueryDocumentSnapshot<ProfileUser?>> query = await profileRef.where('uid' ,isEqualTo: uid).get().then((value) => value.docs);

return query.first.data();

}
static Future<List<ProfileUser>?> getProfiles()async{
  List<QueryDocumentSnapshot<ProfileUser>> query = await profileRef.where('isAdmin' ,isEqualTo: false).get().then((value) => value.docs);

     if(query.isNotEmpty){
   
  var profiles = query.map((e) => e.data());
return profiles.toList();
   }
   return null;
  

}


static Future<void> createProfile(ProfileUser profile)async{
  // ignore: invalid_return_type_for_catch_error
  await profileRef.add(profile).then((value){ currentUser = profile;}).catchError((e)=> print(e));
  

}
  
  }


 