import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petspot/Repositories/user_auth.dart';
import 'package:petspot/classes/user.dart';

class UserDetails {
  static final UserDetails _singleton = UserDetails._internal();
  final FirebaseFirestore _fireBaseStore = FirebaseFirestore.instance;

  factory UserDetails() {
    return _singleton;
  }
  UserAuth auth = UserAuth();

  Future<CurrentUser> getUserInfo() async {
    if (auth.isAnonymous()) {
      CurrentUser user = CurrentUser(
          name: 'Anónimo',
          photo: 'https://cdn-icons-png.flaticon.com/512/4775/4775486.png',
          email: '-',
          telephone: '-');
      return user;
    } else {
      var userDataQuery = await _fireBaseStore
          .collection('usuarios')
          .doc('${FirebaseAuth.instance.currentUser!.uid}');
      var userDoc = await userDataQuery.get();
      String name = userDoc.data()?['nombre'] ?? 'nombrefalso';
      String picture = userDoc.data()?['foto'] ??
          'https://cdn-icons-png.flaticon.com/512/4775/4775486.png';
      String email = userDoc.data()?['email'] ?? '-';
      String telephone = userDoc.data()?['telefono'] ?? '-';

      CurrentUser user = CurrentUser(
          name: name, photo: picture, email: email, telephone: telephone);
      return user;
    }
  }

  UserDetails._internal();
}
