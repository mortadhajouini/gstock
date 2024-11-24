import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gstock/src/data/globals.dart';
import 'package:gstock/src/models/profileModel.dart';
import 'package:gstock/src/services/loginServes.dart';
import 'package:gstock/src/utils/theme_utils.dart';

class UtilisateurList extends StatefulWidget {
  const UtilisateurList({super.key , });

  @override
  State<UtilisateurList> createState() => _UtilisateurListState();
}

class _UtilisateurListState extends State<UtilisateurList> {
   List<ProfileUser> ? listProfile;

@override
  void initState() {
    getUsers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listProfile == null ? Center(child: CircularProgressIndicator()): ListView.separated( itemBuilder: (context,index) => 
        Padding(padding: const EdgeInsets.only(right :10.0 , left: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: ThemeUtils.primaryBlue),
            borderRadius: BorderRadius.circular(20) ,
            
          ),
          child: ListTile (
            
            leading: Icon(Icons.person_2_outlined , size: 30 ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(listProfile![index].nom , style:TextStyle(fontWeight: FontWeight.bold),),
                Text(listProfile![index].prenom , style:TextStyle(fontWeight: FontWeight.bold)),
              
              ],
            ),
            subtitle: Column(

              children: [
                Text(listProfile![index].numeroTelephone),
                Text(listProfile![index].email),
                
              ],
            ),


          ) ,

        ),
        ),
        separatorBuilder: (context,index)=> SizedBox(height: 20.h,),
        itemCount: listProfile!.length ,),
        

    );
  }
   Future  getUsers () async{
      
   
    listProfile = await LoginService.getProfiles( ); 
    userProfiles = listProfile;
    setState(() {
      
    });
  }
}