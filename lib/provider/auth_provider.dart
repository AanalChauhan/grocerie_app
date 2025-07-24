import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocerie_app/views/verification_screen.dart';
import 'package:grocerie_app/widgets/Bottom_navbar.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();



  User? user;
  AuthProvider() {
    user = _auth.currentUser; 
  }

  Future<String?> verifyUser({required String smsCode,required BuildContext context,
  required String verificationid,})async{
    try{
          PhoneAuthCredential credential= await PhoneAuthProvider.credential(verificationId: verificationid, smsCode:smsCode);
        await _auth.signInWithCredential(credential).then((value){Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavbar()));});
         return null;
          }catch(e){return e.toString();}
  }
  
  Future<void> signInUsingPhone({
    required String phoneNumber,
    required BuildContext context,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Verification failed: ${e.message}")),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationScreen(
              verificationid: verificationId,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
  Future<String?>signInWithGoogle()async{
    try{
      final googleUser = await GoogleSignIn().signIn();
      await googleSignIn.signOut();
       if (googleUser == null) return "Sign in cancelled";
      final googleAuth = await googleUser.authentication;
      final cred = GoogleAuthProvider.credential(idToken: googleAuth.idToken,accessToken: googleAuth.accessToken);
      final userCred= await _auth.signInWithCredential(cred);
      user = userCred.user;
      final doc = await _firestore.collection('users').doc(user?.uid).get();
      if (!doc.exists) {
        await _firestore.collection('users').doc(user?.uid).set({
          'uid':user?.uid,
          'email':user?.email,
          'createdAt': DateTime.now(),
        });
      }
      return null;
    } catch(e){
      print(e.toString());
    }
    return "Google Sign-In failed";
  }

  

  Future<String?> signUp(String username, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      // UserCredential userCred = await _auth.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );

      // await _firestore.collection('users').doc(userCred.user!.uid).set({
      //   'uid': userCred.user!.uid,
      //   'username': username,
      //   'email': email,
      // });

      return null; 
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Something went wrong";
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      // await _auth.signInWithEmailAndPassword(email: email, password: password);
       UserCredential userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // await _firestore.collection('users').doc(userCred.user!.uid).set({
      //   'uid': userCred.user!.uid,
      //   'email': email,
      //   'username': username,
      // });

      user = userCred.user;
       final doc = await _firestore.collection('users').doc(userCred.user?.uid).get();
      if (!doc.exists) {
        await _firestore.collection('users').doc(user?.uid).set({
          'uid':user?.uid,
          'email': email,
          'createdAt': DateTime.now(),
        });
      }
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Something went wrong";
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    await googleSignIn.signOut();
  }
}
