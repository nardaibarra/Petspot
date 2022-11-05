//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuth {
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email"]);
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool isSignedIn() {
    return firebaseAuth.currentUser != null;
  }

  Future<void> signOutGoogleUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // You need to sign out from provider first and then notify firebase of this
  Future<void> signOutFirebaseUser() async {
    await firebaseAuth.signOut();
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken, idToken: googleAuth.idToken);

    await firebaseAuth.signInWithCredential(credential);

    //await createUserCollectionFirebase(this.firebaseAuth.currentUser!.uid);
  }

  // Future createUserCollectionFirebase(String uid) async {
  //   var userDoc =
  //       await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //   if (!userDoc.exists) {
  //     await FirebaseFirestore.instance.collection('users').doc(uid).set(
  //       {
  //         "favsList": [],
  //       },
  //     );
  //   } else {
  //     return;
  //   }
  // }

  // Future createUserCollectionFromCopy(String uid, List<String> newList) async {
  //   var userDoc =
  //       await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //   if (userDoc.exists) {
  //     await FirebaseFirestore.instance.collection('users').doc(uid).set(
  //       {
  //         "favsList": newList,
  //       },
  //     );
  //   } else {
  //     return;
  //   }
  // }
}
