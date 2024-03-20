import 'package:firebase_auth/firebase_auth.dart';

class FireBaseHelper {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future loginUser (String email , String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
  Future Signup (String email , String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }
  Future Signout () async {
    await auth.signOut();
  }
  User ? getCurrentUser(){
    return auth.currentUser;
  }

}