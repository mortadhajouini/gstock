library gstock.globals ;

import 'package:gstock/src/models/composant.dart';
import 'package:gstock/src/models/profileModel.dart';
ProfileUser? currentUser;

List<Composant>? currentComposant;
List<ProfileUser>? userProfiles;

List<Composant> favorisComposant =List.empty(growable: true);