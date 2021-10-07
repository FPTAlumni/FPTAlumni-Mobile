import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_alumni/models/request/app_token_request.dart';
import 'package:uni_alumni/models/request/registration_request.dart';
import 'package:uni_alumni/modules/auth/auth_repository.dart';
import 'package:uni_alumni/modules/auth/widgets/custom_full_screen_dialog.dart';
import 'package:uni_alumni/modules/clazz/clazz_controller.dart';
import 'package:uni_alumni/modules/universities/university_controller.dart';
import 'package:uni_alumni/routes/app_pages.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class AuthController extends GetxController {
  AuthRepository authRepository = Get.find();
  UniversityController universityController = Get.find();
  ClazzController clazzController = Get.find();

  String? userToken;

  var selectedClass = 0.obs;
  var selectedUniversity = 0.obs;
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();

  // GlobalKey<FormState>? signInKey = GlobalKey<FormState>();
  var dropdownUniversities = [].obs;
  var dropdownClasses = [].obs;

  late GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var isSignIn = false.obs;
  UserCredential? userCredential;

  @override
  void onInit() {
    super.onInit();
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

    // isSignIn.value = _firebaseAuth.currentUser != null;
    // _firebaseAuth.authStateChanges().listen((event) {
    //   isSignIn.value = event != null;
    // });

    // CustomFullScreenDialog.showDialog();
    // await _autoSignIn();
    // CustomFullScreenDialog.cancelDialog();

    if (!isSignIn.value) {
      universityController.loadUniversities();
    }

    ever(universityController.universities, _loadDropdownUniversities);
    ever(clazzController.clazzList, _loadDropdownClasses);
  }

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
      String firebaseToken = await userCredential!.user!.getIdToken();

      print('call get app token');
      userToken = await authRepository.getAppToken(AppTokenRequest(
          tokenId: firebaseToken, universityId: selectedUniversity.value));

      CustomFullScreenDialog.cancelDialog();

      if (userToken != null) {
        //save universityId
        final prefs = await SharedPreferences.getInstance();
        prefs.setInt('universityId', selectedUniversity.value);

        isSignIn.value = true;
      } else {
        await clazzController.loadClasses();
        Get.toNamed(Routes.SIGN_UP);
      }
    }
  }

  Future<void> logout() async {
    await _googleSignIn.disconnect();
    await _firebaseAuth.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    isSignIn.value = false;
  }

  Future<void> autoSignIn() async {
    bool isFirebaseSignIn = _firebaseAuth.currentUser != null;
    if (!isFirebaseSignIn) return;
    final prefs = await SharedPreferences.getInstance();
    final universityId = prefs.getInt('universityId');
    if (universityId == null) return;

    String tokenId = await _firebaseAuth.currentUser!.getIdToken();
    print('call get app token');
    userToken = await authRepository.getAppToken(
        AppTokenRequest(tokenId: tokenId, universityId: universityId));
    if (userToken != null) {
      isSignIn.value = true;
    }
  }

  onChangeClass(int value) async {
    selectedClass.value = value;
  }

  onChangeUniversity(int value) async {
    selectedUniversity.value = value;
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
          Get.offNamedUntil(Routes.ROOT, (route) => false);
          logout();
        },
      );
    }
  }
}
