import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gstock/src/utils/theme_utils.dart';
import 'package:gstock/src/views/admin/Home_home_views.dart';
import 'package:gstock/src/views/admin/RetourListViews.dart';
import 'package:gstock/src/views/admin/reservationList_views.dart';
import 'package:gstock/src/views/admin/utilisateurListViews.dart';
import 'package:gstock/src/widgets/drawer_widget.dart';


class homeScreen extends StatefulWidget 
{

  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int index = 0; 

  List<Widget> screens = [
    HomeBody(),
    UtilisateurList(), 
    ReservationAdminList(),
    RetourList(),
    ];

  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold( 
      key: _key,
      drawer: Drawer(child: DrawerWidget(), width: 300,),
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.menu,),
        iconSize: 35 ,
        onPressed: () { _key.currentState!.openDrawer(); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
       style: ButtonStyle(iconColor: MaterialStateProperty.all(const Color(0xff52B69A))) ,
  ),  
          title: const Text("home page"),
        actions: [
         IconButton(
            onPressed: () {},
            icon:const Icon(Icons.notifications),
            iconSize: 35,
            style: ButtonStyle(
              iconColor: MaterialStateProperty.all( Color(0xff52B69A)),
              
            ),
          ),],),
          body: screens[index],
          
          
          // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
          bottomNavigationBar: GNav( 
            color: ThemeUtils.secondaryGreenBlue,
            activeColor: ThemeUtils.secondaryGreenBlue,
            selectedIndex: index,
            onTabChange:(value) {
              setState(() {
                index=value;
              });
            },
            tabs: [
             GButton(icon: Icons.home , text: "Home", gap: 4,),
            GButton(icon: Icons.supervised_user_circle , text: "Utilisateurs", gap: 4,),
            GButton(icon: Icons.event_note , text: "Reservations", gap: 4,),
            GButton(icon: Icons.checklist , text:"composant", gap: 4 ,),
          ])

     
    );
  }
}