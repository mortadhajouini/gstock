import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gstock/src/data/globals.dart';
import 'package:gstock/src/models/composant.dart';
import 'package:gstock/src/models/famille_composent.dart';
import 'package:gstock/src/services/composantServes.dart';
import 'package:gstock/src/services/familleComposant_service.dart';
import 'package:gstock/src/utils/theme_utils.dart';
import 'package:gstock/src/views/user/reserverProduitViews.dart';
import 'package:gstock/src/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class UserHome extends StatefulWidget  
{

  UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  // ignore: non_constant_identifier_names
  var ScaffoldUserkey = GlobalKey <ScaffoldState>();
  List<FamilleComposant>? familleList ;
  List<Composant>? composantList;
  List<Composant>? composantFiltredList;
  bool isshow = false ; 
  var rechercheControllor = TextEditingController();
  List<bool>? selectedFamily;
  TextEditingController produitcontrolleur = TextEditingController() ; 
  TextEditingController quantitecontroller = TextEditingController();
  TextEditingController imageController = TextEditingController() ; 
  TextEditingController descriptionControlleur = TextEditingController() ; 
  @override
  void initState() {
    getFamille();
    getlocalComposant();
    super.initState();
  }

void getFamille()async{
  familleList = await FamilleComposantService.getfamilleComposant();
  if(familleList != null) {
    selectedFamily = List.filled(familleList!.length, false);
  }
  
  setState(() {
    
  });
  
}
 @override
  void dispose() {
    rechercheControllor.dispose();
    super.dispose();
  } 

void getlocalComposant()async{
  currentComposant = await ComposantService.getComposant();
  composantList = currentComposant;
  if(composantList != null){
  composantFiltredList = composantList!.where((element) => element.quantiteComposant > 0).toList();}
  setState(() {
    
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldUserkey ,
      body: Column(
        mainAxisAlignment:MainAxisAlignment.start
        ,crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                    Padding (padding: const EdgeInsets.all(20.0),
                    child: TextFieldWidget(label:"", hint: "Rechecher", controller: rechercheControllor, onChanged: (val){
                      if(rechercheControllor.text.isNotEmpty){
                         composantFiltredList = composantList!.where((element) => element.nomComposant.toUpperCase().contains(rechercheControllor.text.toUpperCase())).toList();
                        setState(() {});
                      }
                      return null;
                       
                    }, 
                    prefixicon:Icons.search,
                    
                    ) ), 
                    SizedBox(height: 15.h,) ,
                    Row( 
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:20),
                          child: Text("Categorie : " ,
                           style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize:23.sp,fontWeight: FontWeight.bold ) ),
                        ),
                      ],
                    ),
                      SizedBox(height: 20.h,),
              familleList== null ? CircularProgressIndicator(color: ThemeUtils.primaryBlue,) :        Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: 120.h,
                          
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index) =>
                            GestureDetector(
                              onTap: () {
                            if(selectedFamily![index]){
                                
                              selectedFamily= List.generate(familleList!.length, (index) => false)  ;
                              composantFiltredList = composantList;
                             
                            }else {

                              selectedFamily= List.generate(familleList!.length, (index) => false)  ; 
                            
                                  selectedFamily![index]= true;

           
                                      
                             composantFiltredList=composantList!.where((element) => element.typeComposant == familleList![index].id).toList();
                                  
                                
                            }
                         setState(() {
                           
                         });
                              
                            
                           
                              },
                              child: _fComposent(selectedFamily![index], familleList![index])),
                            separatorBuilder: (context,index) =>
                            SizedBox(width: 10.w,),
                            itemCount: familleList!.length, 
                           
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Text("Tous Les Produit :" , style:Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize:23.sp,fontWeight: FontWeight.bold ),),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                  composantList == null ? CircularProgressIndicator(color: ThemeUtils.primaryBlue,) :   composantFiltredList!.isEmpty ? Image.asset("assets/images/bonny-two-office-workers-analysing-data-via-pie-chart-1.png", width: 200.w,):  Expanded(
                         child: ListView.separated(
                          itemCount: composantFiltredList!.length,
          
                          itemBuilder:  (context, index) =>  GestureDetector( 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ReserverProduit( composant:  composantFiltredList![index],))).then((value) => getlocalComposant()) ,     
                            child:  _produit(Colors.black,composantFiltredList![index])),
                          separatorBuilder: (context, index) => SizedBox(height: 10.w,),
                                               ),
                       )  
      
                   
      ], ),
      
    );
 } 

  Widget  _fComposent (bool isselcted , FamilleComposant famille){
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      elevation: 4,
      child: Container( 
        height: 120.h,
        width: 120.w,
        decoration: BoxDecoration(
          border: Border.all(color: isselcted ? Colors.red : Colors.white),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
               Text(famille.typeComposant, ), 
              SizedBox(height: 5.h,),
              Image.network(famille.imageUrl,width: 70.w,height: 70.h,),
            ],
          ),
        ),
      ),
    );
  }
  


void update(){
  setState(() {
    
  });
}




}
Widget _produit ( Color borderColor , Composant composant)
{
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration (border: Border.all(color: Colors.deepPurpleAccent, ),    borderRadius: BorderRadius.circular(20),),
      child: ListTile(leading:  Image.network(composant.imageUrl ?? "assets/images/icons8-monitor-94.png" ,width: 60.w,)
      ,title: Text(composant.nomComposant)
      ,subtitle:   Text("la quantité totale : ${composant.quantiteComposant}"
      ),
      trailing: IconButton(icon: Icon(Icons.favorite , color: Colors.red,),onPressed: ()=> favorisComposant.add(composant),),),
    ),
  );
}
