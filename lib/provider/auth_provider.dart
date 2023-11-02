import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pygmyapp_menu/models/user_model.dart';

enum Status {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated,
  Registering
}
/*
The UI will depends on the Status to decide which screen/action to be done.

- Uninitialized - Checking user is logged or not, the Splash Screen will be shown
- Authenticated - User is authenticated successfully, Home Page will be shown
- Authenticating - Sign In button just been pressed, progress bar will be shown
- Unauthenticated - User is not authenticated, login page will be shown
- Registering - User just pressed registering, progress bar will be shown

Take note, this is just an idea. You can remove or further add more different
status for your UI or widgets to listen.
 */

class AuthProvider extends ChangeNotifier {
  //Firebase Auth object
  late FirebaseAuth _auth;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Default status
  Status _status = Status.Uninitialized;

  Status get status => _status;

  String _role = "";

  String get role => _role;

  Stream<UserModel> get user => _auth.authStateChanges().map(_userFromFirebase);

  AuthProvider() {
    //initialise object
    _auth = FirebaseAuth.instance;
    //listener for authentication changes such as user sign in and sign out
    _auth.authStateChanges().listen(onAuthStateChanged);
    getUser();
  }

  //Create user object based on the given User
  UserModel _userFromFirebase(User? user) {
    if (user == null) {
      return UserModel(uid: 'null', email: 'null', username: 'null', role: 'null');
    }

    return UserModel(
        uid: user.uid);
  }

  //Method to detect live auth changes such as user sign in and sign out
  Future<void> onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _userFromFirebase(firebaseUser);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  //Method for new user registration using email and password
  Future<UserModel> registerWithEmailAndPassword(String username, String email, String password) async {
    try {
      _status = Status.Registering;
      notifyListeners();
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
          addUserToDB(result.user!.uid, email, username, "user");
          getUser();
      return _userFromFirebase(result.user);
    } catch (e) {
      print("Error on the new user registration = $e");
      _status = Status.Unauthenticated;
      notifyListeners();
      return UserModel(username: 'Null', uid: 'null');
    }
  }

  //Method to handle user sign in using email and password
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      getUser();
      return true;
    } catch (e) {
      print("Error on the sign in = $e");
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  //Method to handle password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  //Method to handle user signing out
  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void setRole(String role) {
    _role = role;
    notifyListeners();
  }

  void addUserToDB(String uid, String email, String username, String role) async {
    await firestore.collection("users").doc(uid).set({
      "uid": uid,
      "email": email,
      "username": username,
      "role": role
    });
  }

  Future<UserModel> getUser() async {
    String uid = _auth.currentUser!.uid;
    if(uid != ""){
      var collection = firestore.collection('users');
      var docSnapshot = await collection.doc(uid).get();
      if (docSnapshot.exists) {
        Map<String, dynamic>? data = docSnapshot.data();
        setRole(data?['role']);
        return UserModel(
            uid: data?['uid'],
            email: data?['email'],
            username: data?['username'],
            role: data?['role']);
      }
    }
    notifyListeners();
    return UserModel(uid: uid);
  }
  
}