
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';

import '../referral_controller.dart';

class ReferralRegistration extends StatelessWidget {

  // final ReferralController controller = Get.put(ReferralController());
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final double addHeight = 0.03;
    return  Scaffold(
      appBar: SubScreenAppBar(
        title: 'New referral',
      ),
      backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Form(
          key: _formKey, //key for form
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: height * addHeight,
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10) ),
                child: GridTile(
                  child: Image.asset(
                    'assets/images/referral.jpg',
                    width: 400,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: height * addHeight,
              ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: "Full name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                            .hasMatch(value)) {
                      return "Enter your name";
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: height * addHeight,
              ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: "Phone",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value)) {
                      return "Enter correct phone";
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: height * addHeight,
              ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                            .hasMatch(value)) {
                      return "Enter correct address";
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: height * addHeight,
              ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nominator",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                            .hasMatch(value)) {
                      return "Enter nominator's name";
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                height: height * addHeight,
              ),

              //combobox
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5),
              //     border: Border.all(color: Colors.black, width: 4),
              //   ),
              //   child:  GetBuilder<ReferralController>(
              //     builder: (referralController){
              //       return  DropdownButtonHideUnderline(
              //         child: DropdownButton<String>(
              //           hint: Text('Please choose discount'),
              //           value: referralController.selectedValue == null ? "Please choose a voucher" : referralController.selectedValue,
              //           iconSize: 36,
              //           isExpanded: true,
              //           items: referralController.vouchers.map((e) => buildMenuItem(e)).toList(),
              //           onChanged: (selectedValue){
              //             referralController.relationShipStatus(selectedValue);
              //           },
              //         ),
              //       );
              //     }
              //   ),
              //
              //   ),


              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

                 Padding(
                   padding: const EdgeInsets.only(left: 50, right: 30, bottom: 50),
                   child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(250, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Submit',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {
                          //Check if form data are valid,
                          //your process atsk ahead if all data are valid
                          final snackBar = SnackBar(content: Text('Submit form'));
                          _scaffoldKey.currentState!.showSnackBar(snackBar);
                        }
                      },
                    ),
                 ),

              ]),
            ]),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));

}
