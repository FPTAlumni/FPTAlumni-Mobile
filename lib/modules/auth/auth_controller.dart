import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uni_alumni/models/request/app_token_request.dart';
import 'package:uni_alumni/modules/auth/auth_repository.dart';
import 'package:uni_alumni/modules/auth/widgets/custom_full_screen_dialog.dart';
import 'package:uni_alumni/modules/clazz/clazz_controller.dart';
import 'package:uni_alumni/modules/universities/university_controller.dart';
import 'package:uni_alumni/routes/app_pages.dart';

class AuthController extends GetxController {
  AuthRepository authRepository = Get.find();
  UniversityController universityController = Get.find();
  ClazzController clazzController = Get.find();

  String? userToken;

  var selectedClass = 0.obs;
  var selectedUniversity = 0.obs;
  final signUpKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();

  final signInKey = GlobalKey<FormState>();
  var dropdownUniversities = [].obs;
  var dropdownClasses = [].obs;

  late GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var isSignIn = false.obs;
  UserCredential? userCredential;

  @override
  void onInit() {
    super.onInit();
    universityController.loadUniversities();
  }

  _loadDropdownUniversities(listUniversities) {
    //load listUniversities to dropdownUniversities
    print('load universities');
    listUniversities.forEach((university) {
      dropdownUniversities.add(DropdownMenuItem(
        value: university.id,
        child: Text(university.name),
      ));
    });
  }

  _loadDropdownClasses(listClasses) {
    //load clazzList to dropdownClasses
    print('load classes');
    listClasses.forEach((clazz) {
      dropdownClasses.add(DropdownMenuItem(
        value: clazz.id,
        child: Text(clazz.name),
      ));
    });
  }

  //Todo: auto login (do later)
  @override
  onReady() async {
    super.onReady();

    isSignIn.value = _firebaseAuth.currentUser != null;
    _firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });

    ever(universityController.universities, _loadDropdownUniversities);
    ever(clazzController.clazzList, _loadDropdownClasses);
  }

  void signIn() async {
    if (!signInKey.currentState!.validate()) {
      return;
    }
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
      String firebaseToken = await userCredential!.user!.getIdToken();
      // print(firebaseToken);
      CustomFullScreenDialog.cancelDialog();
      print('call get app token');
      userToken = await authRepository.getAppToken(AppTokenRequest(
          tokenId: firebaseToken, universityId: selectedUniversity.value));

      if (userToken != null) {
        isSignIn.value = true;
      } else {
        await clazzController.loadClasses();
        Get.toNamed(Routes.SIGN_UP);
      }
      // logout();
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

  onChangeUniversity(int value) async {
    selectedUniversity.value = value;
  }

  onSubmitForm() {
    //check form validation
    final isValidate = signUpKey.currentState!.validate();
    if (!isValidate) return;

    //send registration request to server

    //back to sign in page and print
    //"Please wait for our admin verify your information"

    //sign out current account

    print(userCredential!.user!.email);
  }
}
