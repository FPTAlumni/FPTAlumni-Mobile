import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_alumni/models/clazz.dart';
import 'package:uni_alumni/models/request/app_token_request.dart';
import 'package:uni_alumni/models/request/registration_request.dart';
import 'package:uni_alumni/models/response/app_token_response.dart';
import 'package:uni_alumni/models/alumni.dart';
import 'package:uni_alumni/models/university.dart';
import 'package:uni_alumni/modules/auth/auth_repository.dart';
import 'package:uni_alumni/modules/auth/widgets/custom_full_screen_dialog.dart';
import 'package:uni_alumni/modules/clazz/clazz_controller.dart';
import 'package:uni_alumni/modules/majors/major_controller.dart';
import 'package:uni_alumni/modules/universities/university_controller.dart';
import 'package:uni_alumni/routes/app_pages.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/error_dialog.dart';

class AuthController extends GetxController {
  AuthRepository authRepository = Get.find();
  UniversityController universityController = Get.find();
  ClazzController clazzController = Get.find();
  MajorController majorController = Get.find();

  AppTokenResponse? userAuthentication;
  Alumni? currentUser;

  var selectedClass = 0.obs;
  var selectedUniversity = 0.obs;
  var selectedMajor = 0.obs;
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();

  var dropdownUniversities = [].obs;
  var dropdownClasses = [].obs;
  var dropdownMajors = [].obs;

  late GoogleSignIn _googleSignIn = GoogleSignIn();
  late FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var isSignIn = false.obs;
  UserCredential? userCredential;

  late Future<void> autoSignIn;

  @override
  void onInit() {
    super.onInit();
    autoSignIn = _autoSignIn();
  }

  @override
  onReady() async {
    super.onReady();

    ever(universityController.universities, _loadDropdownUniversities);
    ever(clazzController.clazzList, _loadDropdownClasses);
    ever(majorController.majors, _loadDropdownMajors);
  }

  void signIn() async {
    print('Sign In');
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

      print('call get app token');
      try {
        userAuthentication = await authRepository
            .getAppToken(AppTokenRequest(tokenId: firebaseToken));
      } on HttpException catch (e) {
        print('error ne');
        CustomFullScreenDialog.cancelDialog();
        ErrorDialog.showDialog(content: e.message);
        return;
      }

      CustomFullScreenDialog.cancelDialog();

      if (userAuthentication != null) {
        print(userAuthentication!.appToken);

        currentUser = await authRepository.getUserById(
            userAuthentication!.id, userAuthentication!.appToken);

        if (currentUser == null) return;

        //save universityId
        final prefs = Get.find<SharedPreferences>();
        prefs.setString('uId', googleAuth.idToken!);
        await FirebaseMessaging.instance
            .subscribeToTopic('${currentUser!.uid}');
        isSignIn.value = true;
      } else {
        await universityController.loadUniversities();
        await Get.toNamed(Routes.signUp);
        logout();
      }
    }
  }

  Future<void> logout() async {
    if (currentUser != null) {
      await FirebaseMessaging.instance
          .unsubscribeFromTopic('${currentUser!.uid}');
    }
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    final prefs = Get.find<SharedPreferences>();
    prefs.clear();
    // isSignIn.value = false;
  }

  Future _autoSignIn() async {
    print('Auto Sign In');
    //check firebase authentication
    final isFirebaseSignIn = _firebaseAuth.currentUser != null;
    if (!isFirebaseSignIn) return;

    //check if uid exist
    final prefs = Get.find<SharedPreferences>();
    final uId = prefs.getString('uId');
    if (uId == null) return;

    String tokenId = await _firebaseAuth.currentUser!.getIdToken();
    // print('call get app token');
    try {
      userAuthentication =
          await authRepository.getAppToken(AppTokenRequest(tokenId: tokenId));
    } on HttpException catch (e) {
      ErrorDialog.showDialog(content: e.message);
    }
    print(userAuthentication!.appToken);
    if (userAuthentication != null) {
      // print('Get user Id');
      currentUser = await authRepository.getUserById(
          userAuthentication!.id, userAuthentication!.appToken);
      isSignIn.value = true;
    }
  }

  _loadDropdownUniversities(listUniversities) {
    dropdownUniversities.value = [];
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
    //reset dropdownClass
    dropdownClasses.value = [];

    //load clazzList to dropdownClasses
    print('load classes');
    listClasses.forEach((clazz) {
      dropdownClasses.add(DropdownMenuItem(
        value: clazz.id,
        child: Text(clazz.name),
      ));
    });
  }

  _loadDropdownMajors(listMajors) {
    //reset dropdownClass
    dropdownMajors.value = [];

    print('load majors');
    listMajors.forEach((major) {
      dropdownMajors.add(DropdownMenuItem(
        value: major.id,
        child: Text(major.fullName),
      ));
    });
  }

  onChangeUniversity(int value) async {
    selectedUniversity.value = value;

    //load listClasses by university id
    final List<Clazz>? _listClasses = (universityController.universities
            .firstWhere((university) => university.id == value) as University)
        .classes;
    _listClasses == null
        ? clazzController.clazzList.value = []
        : clazzController.clazzList.value = _listClasses;

    //reset selected class value
    selectedClass.value = 0;
    //reset selected major value
    selectedMajor.value = 0;

    dropdownMajors.value = [];
  }

  onChangeClass(int value) async {
    selectedClass.value = value;

    //load majors from db
    majorController.getMajors(value);

    //reset selected major value
    selectedMajor.value = 0;
  }

  onChangeMajor(int value) {
    selectedMajor.value = value;
  }

  onSubmitForm() async {
    CustomFullScreenDialog.showDialog();

    //create data
    RegistrationRequest data = RegistrationRequest(
      uid: userCredential!.user!.uid,
      phone: phoneController.text,
      fullName: fullNameController.text,
      dob: DateFormat('MM/dd/yyyy').parse(dobController.text),
      classId: selectedClass.value,
      majorId: selectedMajor.value,
    );

    //send registration request to server
    bool isSuccess = await authRepository.register(data);

    if (isSuccess) {
      CustomFullScreenDialog.cancelDialog();

      //show dialog
      //"Please wait for our admins verify your information"
      await Get.defaultDialog(
        title: 'Notifications',
        middleText: "Please wait for our admins verify your information",
        textConfirm: 'Close',
        confirmTextColor: Colors.white,
        barrierDismissible: false,
        buttonColor: ColorConstants.primaryAppColor,
        titlePadding: const EdgeInsets.all(10),
        onConfirm: () {
          Get.offNamedUntil(Routes.root, (route) => false);
          logout();
        },
      );
    } else {
      CustomFullScreenDialog.cancelDialog();
      ErrorDialog.showDialog();
    }
  }
}
