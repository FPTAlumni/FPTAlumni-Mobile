import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class FilterDialog {
  List<String>? _filters;

  List<String> get filterList {
    if (_filters != null) {
      return [..._filters!];
    }

    return _filters = [];
  }

  showDialog(
      {required BuildContext context,
      required List<String> filtersData,
      required List<String> selectedFilters}) async {
    await FilterListDialog.display<String>(
      context,
      listData: filtersData,
      selectedListData: selectedFilters,
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
          _filters = List.from(list);
          // controller.selectedFilterList.value = List.from(list);
          // controller.selectedFilterList.forEach((element) {
          //   print(element);
          // });
        } else {
          _filters = [];
        }
        Get.back();
      },
    );
  }
}
