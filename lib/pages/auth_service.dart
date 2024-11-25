import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final _auth = FirebaseAuth.instance;

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