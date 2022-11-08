//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuth {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool isSignedIn() {
    return _firebaseAuth.currentUser != null;
  }

  Future<void> signOutGoogleUser() async {
    await _googleSignIn.signOut();
  }

  Future<void> signOutFirebaseUser() async {
    await _firebaseAuth.signOut();
  }

  Future<void> signInWithGoogle() async {
    //Google sign in
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;

    print(">> User email:${googleUser.email}");
    print(">> User name:${googleUser.displayName}");
    print(">> User photo:${googleUser.photoUrl}");

    // credenciales de usuario autenticado con Google
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // firebase sign in con credenciales de Google
    final authResult = await _firebaseAuth.signInWithCredential(credential);

    // Extraer token**
    User user = authResult.user!;
    final firebaseToken = await user.getIdToken();
    print("user fcm token:${firebaseToken}");
  }
}
