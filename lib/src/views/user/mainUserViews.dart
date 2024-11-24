import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gstock/src/utils/theme_utils.dart';
import 'package:gstock/src/views/user/DoneUserViews.dart';
import 'package:gstock/src/views/user/archiveUser_views.dart';
import 'package:gstock/src/views/user/favoriteViews.dart';
import 'package:gstock/src/views/user/userHome.dart';
import 'package:gstock/src/widgets/drawer_widget.dart';

class mainUser extends StatefulWidget {
  const mainUser({super.key});

  @override
  State<mainUser> createState() => _mainUserState();
}

class _mainUserState extends State<mainUser> { 
    int index =0;

  List<Widget> screens = [
    UserHome() ,
    FavoriteUser(),
    ArchiveUser(),
    RetourComposantScreens(),

     
    ] ;

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
            GButton(icon: Icons.home , text: "Home", gap: 6, ) ,
            GButton(icon: Icons.favorite , text: "Favorite", gap: 6,),
            GButton(icon: Icons.archive , text: "Archive", gap: 6,),
            GButton(icon: Icons.done_all_outlined ,text: "Retourner", gap: 6,), 
            
          ])

     
    );
  }
  }
