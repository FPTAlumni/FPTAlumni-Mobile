import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/models/tag.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class FilterDialog {
  Tag? filter;

  showDialog(
      {required BuildContext context,
      required List<Tag> filtersData,
      required List<Tag>? selectedFilters}) {
    return FilterListDialog.display<Tag>(
      context,
      listData: filtersData,
      selectedListData: selectedFilters,
      height: 480,
      headlineText: "Select Filters",
      searchFieldHintText: "Search...",
      enableOnlySingleSelection: true,
      applyButonTextBackgroundColor: ColorConstants.lightPrimaryAppColor,
      selectedTextBackgroundColor: ColorConstants.lightPrimaryAppColor,
      controlButtonTextStyle: TextStyle(
        color: ColorConstants.lightPrimaryAppColor,
        fontSize: 15,
      ),
      hideSelectedTextCount: true,
      applyButtonTextStyle: TextStyle(
        color: ColorConstants.white,
        fontSize: 15,
      ),
      closeIconColor: Colors.red,
      choiceChipLabel: (item) {
        return item!.tagName;
      },
      validateSelectedItem: (list, val) {
        return list!.contains(val);
      },
      onItemSearch: (list, text) {
        if (list!.any((element) =>
            element.tagName.toLowerCase().contains(text.toLowerCase()))) {
          return list
              .where((element) =>
                  element.tagName.toLowerCase().contains(text.toLowerCase()))
              .toList();
        } else {
          return [];
        }
      },
      onApplyButtonClick: (list) {
        if (list != null && list.isNotEmpty) {
          filter = List.from(list)[0];
          // controller.selectedFilterList.value = List.from(list);
          // controller.selectedFilterList.forEach((element) {
          //   print(element);
          // });
        } else {
          filter = null;
        }
        Get.back();
      },
    );
  }
}
