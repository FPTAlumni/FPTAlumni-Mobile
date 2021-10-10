import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_controller.dart';
import 'package:uni_alumni/modules/recruitment/widgets/recruitment_list.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/filters.dart';
import 'package:uni_alumni/shared/utils/filter_dialog.dart';

class RecruitmentTab extends StatelessWidget {
  final RecruitmentController controller = Get.put(RecruitmentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: Container(
          height: 110 - MediaQuery.of(context).padding.top - 5,
          color: ColorConstants.white,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 10,
            left: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15.0),
                    child: Image.asset(
                      AssetConstants.logo,
                      width: 40,
                    ),
                  ),
                  Text(
                    'ALUMNI',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.primaryAppColor,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
              Spacer(),
              ClipOval(
                child: Material(
                  elevation: 2.0,
                  color: ColorConstants.lightPrimaryAppColor,
                  child: InkWell(
                    splashColor: Color.fromRGBO(128, 128, 128, 0.6),
                    onTap: () async {
                      FilterDialog dialog = FilterDialog();
                      await dialog.showDialog(
                          context: context,
                          filtersData: FiltersData.jobsFilters,
                          selectedFilters: controller.selectedFilterList
                              .toList()
                              .cast<String>());
                      controller.selectedFilterList.value = dialog.filterList;
                    },
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Container(
                        child: Image.asset(
                          AssetConstants.filter,
                          color: Colors.white70,
                        ),
                        padding: const EdgeInsets.all(5.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ClipOval(
                child: Material(
                  elevation: 2.0,
                  color: ColorConstants.lightPrimaryAppColor,
                  child: InkWell(
                    splashColor: Color.fromRGBO(128, 128, 128, 0.6),
                    onTap: () {},
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Container(
                        child: Icon(
                          Icons.add,
                          color: Colors.white70,
                          size: 25.0,
                        ),
                        padding: const EdgeInsets.all(5.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
      body: RecruitmentList(),
    );
  }
}
