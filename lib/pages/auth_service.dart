import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final _auth = FirebaseAuth.instance;

  Future <UserCredential?> loginWithGoogle() async{

    try{

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }
    // final googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );


      // Sign in to Firebase with the Google credential
      return await _auth.signInWithCredential(credential);

    }catch(e){
      print("Google Sign-In failed : $e");

    }

  }

  Future<User?> createUserWithEmailAndPassword(String email,
  String password) async{
    try {
      final credential= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e){
      print("Error: $e");
      return null;
    }
  }

  Future<User?> loginUserWithEmailAndPassword(String email,
      String password) async{
    try {
      final credential= await _auth.signInWithEmailAndPassword(email: email, password: password);

      return credential.user;
    } catch (e){
      print("Error $e");
      return null;
    }
  }

  Future<void> signout() async{
    try{
     await _auth.signOut();
    } catch(e){
      print("Something went wrong");

    }
  }
}