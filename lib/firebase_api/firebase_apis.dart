import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
class FirebaseApi{
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  static Future<void> saveData({
    required String userName,
    required String phoneNumber,
    required String district,
})async{
    FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
    await firebaseFireStore.collection('signUp').add({
      'userName': userName,
      'password': phoneNumber,
      'district': district

    });

  }

}