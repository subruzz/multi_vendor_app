import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static Future<String> signUpUser(String email, String fullName,
      String phoneNumber, String password) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty &&
          fullName.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await _fireStore.collection('buyers').doc(cred.user!.uid).set({
          'email': email,
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'buyerId': cred.user!.uid,
          'address': '',
        });
        res = 'success';
        print(cred);
      } else {
        res = 'All fields are required';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = e.toString();
      } else if (e.code == 'email-already-in-use') {
        res = e.toString();
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  static Future<String> loginUser(String email, String password) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
        print(cred);
      } else {
        res = 'All fields are required';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = e.toString();
      } else if (e.code == 'wrong-password') {
        res = e.toString();
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
