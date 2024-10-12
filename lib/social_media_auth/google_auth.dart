import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthScreen extends StatefulWidget {
  const GoogleAuthScreen({super.key});

  @override
  State<GoogleAuthScreen> createState() => _GoogleAuthScreenState();
}

class _GoogleAuthScreenState extends State<GoogleAuthScreen> {

  Map<String, dynamic>? _userData;
  String welcome = "Facebook";
  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential? authCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(authCredential);
    print(userCredential.user!.displayName);
  }

  Future<UserCredential> signInWithFaceBook() async{
    final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ['email']);
    if(loginResult == LoginStatus.success){
      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    }
    else{
      print(loginResult.message);
    }
    setState(() {
      welcome = _userData!['email'];

    });
    final OAuthCredential oAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    return FirebaseAuth.instance.signInWithCredential(oAuthCredential);


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
                onPressed: () {
                  signInWithGoogle();
                },
                child: const Text('Sign in with Google')),
            ElevatedButton(
                onPressed: () {
                  signInWithFaceBook();
                }, child:  Text(welcome))
          ],
        ),
      ),
    );
  }
}
