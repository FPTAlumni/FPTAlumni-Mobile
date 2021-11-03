import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/recruitment.dart';
import 'package:uni_alumni/modules/recruitment/screen/recruitment_details_screen.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/utils/format_utils.dart';

class RecruitmentCard extends StatelessWidget {
  final Recruitment job;

  RecruitmentCard({required this.job, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => RecruitmentDetailsScreen(job)),
      child: Container(
        color: ColorConstants.white,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 15.0,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  padding: const EdgeInsets.all(5.0),
                  // padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.tipColor),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  width: 100,
                  child: Hero(
                    tag: 'job-${job.id}',
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Image.network(
                          job.company!.imageUrl!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.title!,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        job.company!.companyName!,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'End date: ${FormatUtils.toddMMyyyyHHmm(job.endDate!)}',
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Chip(
                              label: Text(
                                job.typeString,
                                textScaleFactor: 3 / 4,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              backgroundColor: Colors.orange[200],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Chip(
                              label: Text(
                                job.experienceLevel!,
                                textScaleFactor: 3 / 4,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              backgroundColor: Colors.green[200],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
