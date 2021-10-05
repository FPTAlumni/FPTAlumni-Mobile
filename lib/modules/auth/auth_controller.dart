import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uni_alumni/models/clazz.dart';
import 'package:uni_alumni/modules/auth/widgets/custom_full_screen_dialog.dart';
import 'package:uni_alumni/routes/app_pages.dart';

class AuthController extends GetxController {
  var selectedClass = 0.obs;
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();

  List<DropdownMenuItem> dropdownClass = [];

  List<Clazz> _listClass = [
    Clazz(1, 'K6'),
    Clazz(2, 'K7'),
    Clazz(3, 'K8'),
    Clazz(4, 'K9'),
    Clazz(5, 'K10'),
    Clazz(6, 'K11'),
    Clazz(7, 'K12'),
    Clazz(8, 'K13'),
  ];

  late GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var isSignIn = false.obs;
  UserCredential? userCredential;

  @override
  void onInit() {
    print('onInit');
    super.onInit();

    //load _listClass to dropdownClass
    _listClass.forEach((clazz) {
      dropdownClass.add(DropdownMenuItem(
        value: clazz.id,
        child: Text(clazz.name),
      ));
    });
  }

  //Todo: auto login (do later)
  @override
  onReady() async {
    print('onReady');
    _googleSignIn = GoogleSignIn();
    // isSignIn = await firebaseAuth.currentUser != null;
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;

  void signIn() async {
    //showing spinning
    CustomFullScreenDialog.showDialog();

    //open a dialog where user can select email to sign in
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      CustomFullScreenDialog.cancelDialog();
    } else {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      //get credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      userCredential = await _firebaseAuth.signInWithCredential(credential);
      await userCredential!.user!.getIdToken().then((token) => print(token));
      CustomFullScreenDialog.cancelDialog();
      // logout();
      // Get.toNamed(Routes.SIGN_UP);
      isSignIn.value = true;
    }
  }

  void logout() async {
    await _googleSignIn.disconnect();
    await _firebaseAuth.signOut();
    isSignIn.value = false;
  }

  onChangeClass(int value) async {
    selectedClass.value = value;
  }

  onSubmitForm() {
    print(userCredential!.user!.email);
    Get.toNamed(Routes.MAIN);
    final isValidate = formKey.currentState!.validate();
    if (!isValidate) return;
  }
}
