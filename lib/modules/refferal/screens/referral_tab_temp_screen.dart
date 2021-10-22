// class ReferralTab extends GetView<MainController> {
//   final _referralController = new PageController(initialPage: 0);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
//         appBar: AppBar(
//           elevation: 0.0,
//           backgroundColor: Colors.white,
//           title: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(right: 15.0),
//                 child: Image.asset(
//                   AssetConstants.logo,
//                   width: 40,
//                 ),
//               ),
//               Text(
//                 'ALUMNI',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: ColorConstants.primaryAppColor,
//                   fontSize: 20,
//                   fontFamily: 'Poppins',
//                   letterSpacing: 3,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: PageView.builder(
//           controller: _referralController,
//           itemBuilder: (context, index) {
//             return Column(children: <Widget>[
//               Image.asset(
//                 'assets/images/alumni_background.jpg',
//                 width: 400,
//                 height: 250,
//                 fit: BoxFit.fitWidth,
//               ),
//               SizedBox(height: 4),
//               Expanded(
//                 child: Container(
//                   width: 350,
//                   decoration: BoxDecoration(
//                     color: ColorConstants.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: SafeArea(
//                     child: Column(
//                       children: <Widget>[
//                         SizedBox(height: 11),
//                         Text(
//                           'The Alumni Referring Students Service',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 13),
//                         Text(
//                           'Let\'s more student become a member of \n our university  ',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 15,
//                           ),
//                         ),
//                         //Create new referral
//                         SizedBox(height: 25),
//                         FlatButton(
//                           splashColor: ColorConstants.lightGray,
//                           onPressed: () {
//                             Get.to(ReferralRegistration());
//                           },
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             side: BorderSide(
//                               color: Colors.blue.shade600,
//                             ),
//                           ),
//                           child: Container(
//                             width: 160,
//                             height: 50,
//                             alignment: Alignment.center,
//                             child: Text(
//                               'Let\'s referral',
//                               style: TextStyle(
//                                 color: Colors.blue.shade600,
//                                 fontSize: 19,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         //Manage referrers
//                         SizedBox(height: 20),
//                         FlatButton(
//                           splashColor: ColorConstants.lightGray,
//                           onPressed: () {
//                             Get.to(ReferralList());
//                           },
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             side: BorderSide(
//                               color: Colors.blue.shade500,
//                             ),
//                           ),
//                           child: Container(
//                             width: 160,
//                             height: 50,
//                             alignment: Alignment.center,
//                             child: Text(
//                               'Manage referrers',
//                               style: TextStyle(
//                                 color: Colors.blue.shade600,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         //More Information
//                         SizedBox(height: 20),
//                         FlatButton(
//                           splashColor: ColorConstants.lightGray,
//                           onPressed: () {
//
//                           },
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             side: BorderSide(
//                               color: Colors.blue.shade600,
//                             ),
//                           ),
//                           child: Container(
//                             width: 160,
//                             height: 50,
//                             alignment: Alignment.center,
//                             child: Text(
//                               'More Information',
//                               style: TextStyle(
//                                 color: Colors.blue.shade600,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ]);
//           },
//           itemCount: 1,
//         ));
//   }
// }