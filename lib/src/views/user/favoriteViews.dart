import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gstock/src/data/globals.dart';
import 'package:gstock/src/models/composant.dart';
import 'package:gstock/src/services/composantServes.dart';
import 'package:gstock/src/utils/theme_utils.dart';

class FavoriteUser extends StatefulWidget {
  const FavoriteUser({super.key});

  @override
  State<FavoriteUser> createState() => _FavoriteUser();
}


class _FavoriteUser extends State<FavoriteUser> {
  List<Composant>? favoriteComposant ;
  @override
  void initState() {
    getComposant();
    // TODO: implement initState
    super.initState();
  }
  getComposant ()async{
  List<Composant>?   composant =await ComposantService.getComposant();
    if(composant != null){
      if(composant.isNotEmpty){
          favoriteComposant = composant.sublist(0 , composant.length-2);
      }
    }
    setState(() {
      
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favoris'), centerTitle: true,),
      body: favoriteComposant == null ? CircularProgressIndicator() : favorisComposant.isEmpty ? SizedBox():  ListView.separated(itemBuilder: (context,index)=>Padding(
        padding: const EdgeInsets.only(right : 10.0 , left: 10),
        child: Container(decoration: BoxDecoration(border: Border.all(color: ThemeUtils.secondaryGreenBlue),borderRadius: BorderRadius.circular(20)),width: MediaQuery.sizeOf(context).width*.85, child: ListTile( leading: Image.network(favorisComposant[index].imageUrl! , width: 50.w,) ,title: Text(favorisComposant[index].nomComposant) , subtitle: Text('quatity : ${favorisComposant![index].quantiteComposant}'), trailing: IconButton(icon:Icon(Icons.favorite , color: Colors.red,) , onPressed: (){
          favorisComposant.removeAt(index); setState(() {
            
          });
        },) ,),),
      ), separatorBuilder: (context,index)=> SizedBox(height: 20.h,), itemCount: favorisComposant.length));
  }
}