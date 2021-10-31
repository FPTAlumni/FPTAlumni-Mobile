import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/recruitment.dart';
import 'package:uni_alumni/modules/recruitment/widgets/bs_job_actions.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/utils/format_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class RecruitmentDetailsScreen extends StatelessWidget {
  final String url =
      'https://cdn.pixabay.com/photo/2015/12/11/11/43/google-1088004_1280.png';

  final Recruitment job;
  final isMyJob;

  RecruitmentDetailsScreen(this.job, {this.isMyJob = false});

  @override
  Widget build(BuildContext context) {
    var _job = Rx(job);
    return Obx(() => Scaffold(
          backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              _job.value.company!.companyName!,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                top: 25.0,
                bottom: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          right: 10.0,
                          bottom: 0.0,
                        ),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/originals/48/a9/8a/48a98a3200a2fd9f857890aed4413357.jpg'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              softWrap: true,
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(text: _job.value.alumni!.fullName),
                                  WidgetSpan(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        top: 5.0,
                                      ),
                                      child: Icon(
                                        Icons.arrow_right,
                                        size: 17,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),
                                  TextSpan(text: _job.value.group!.groupName),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              FormatUtils.toddMMyyyyHHmm(
                                  _job.value.createdDate!),
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      if (isMyJob)
                        GestureDetector(
                          onTap: () {
                            BSJobActions.showBottomSheet(_job,
                                isInDetails: true);
                          },
                          child: Container(
                            child: Icon(Icons.more_horiz),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 10.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: ColorConstants.lightScaffoldBackgroundColor,
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    NetworkImage(_job.value.company!.imageUrl!),
                                fit: BoxFit.fitWidth,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Center(
                          child: Text(
                            _job.value.title!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            _job.value.company!.location!,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.orange[200],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '#${_job.value.typeString}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '#${_job.value.experienceLevel}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Text(
                            _job.value.description!,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey[200]!),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Contacts",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Spacer(),
                        ClipOval(
                          child: Material(
                            color: Colors.green[100],
                            child: InkWell(
                              onTap: () async {
                                final Uri phoneLaunchUri = Uri(
                                  scheme: 'tel',
                                  path: _job.value.phone,
                                );

                                if (await canLaunch(
                                    phoneLaunchUri.toString())) {
                                  await launch(phoneLaunchUri.toString());
                                } else {
                                  print('error');
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.phone,
                                    size: 25,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        ClipOval(
                          child: Material(
                            color: Colors.orange[100],
                            child: InkWell(
                              onTap: () async {
                                final Uri emailLaunchUri = Uri(
                                  scheme: 'mailTo',
                                  path: _job.value.email,
                                );

                                if (await canLaunch(
                                    emailLaunchUri.toString())) {
                                  await launch(emailLaunchUri.toString());
                                } else {
                                  print('error');
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.mail,
                                    size: 25,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildRequirement(String requirement) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Flexible(
            child: Text(
              requirement,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
