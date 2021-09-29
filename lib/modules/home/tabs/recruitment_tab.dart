import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/recruitment/recruitment_controller.dart';
import 'package:uni_alumni/modules/recruitment/widgets/recruitment_list.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/data/filters.dart';

class RecruitmentTab extends StatelessWidget {
  final RecruitmentController controller = Get.put(RecruitmentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: Container(
          height: 110 - MediaQuery.of(context).padding.top + 5,
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
              RawMaterialButton(
                constraints: BoxConstraints(
                  minWidth: 36.0,
                  maxWidth: 36.0,
                ),
                onPressed: () {
                  _openFilterDialog(context);
                },
                elevation: 2.0,
                fillColor: ColorConstants.lightPrimaryAppColor,
                child: Image.asset(
                  AssetConstants.filter,
                  width: 25,
                  color: Colors.white70,
                ),
                padding: EdgeInsets.all(5.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                constraints: BoxConstraints(
                  minWidth: 36.0,
                  maxWidth: 36.0,
                ),
                onPressed: () {},
                elevation: 2.0,
                fillColor: ColorConstants.lightPrimaryAppColor,
                child: Icon(
                  Icons.add,
                  color: Colors.white70,
                  size: 25.0,
                ),
                padding: EdgeInsets.all(5.0),
                shape: CircleBorder(),
              ),
            ],
          ),
        ),
      ),
      body: RecruitmentList(),
    );
  }

  void _openFilterDialog(BuildContext context) async {
    await FilterListDialog.display<String>(
      context,
      listData: FiltersData.jobsFilters,
      selectedListData: controller.selectedFilterList.toList().cast<String>(),
      height: 480,
      headlineText: "Select Filters",
      searchFieldHintText: "Search...",
      applyButonTextBackgroundColor: ColorConstants.lightPrimaryAppColor,
      selectedTextBackgroundColor: ColorConstants.lightPrimaryAppColor,
      controlButtonTextStyle: TextStyle(
        color: ColorConstants.lightPrimaryAppColor,
        fontSize: 15,
      ),
      applyButtonTextStyle: TextStyle(
        color: ColorConstants.white,
        fontSize: 15,
      ),
      closeIconColor: Colors.red,
      choiceChipLabel: (item) {
        return item;
      },
      validateSelectedItem: (list, val) {
        return list!.contains(val);
      },
      onItemSearch: (list, text) {
        if (list!.any(
            (element) => element.toLowerCase().contains(text.toLowerCase()))) {
          return list
              .where((element) =>
                  element.toLowerCase().contains(text.toLowerCase()))
              .toList();
        } else {
          return [];
        }
      },
      onApplyButtonClick: (list) {
        if (list != null) {
          controller.selectedFilterList.value = List.from(list);
          controller.selectedFilterList.forEach((element) {
            print(element);
          });
        }
        Get.back();
      },
    );
  }
}
