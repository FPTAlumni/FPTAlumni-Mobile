import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:uni_alumni/modules/events/event_controller.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final eventController = Get.find<EventController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubScreenAppBar(
        title: 'Create an Event',
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstants.lightPrimaryAppColor,
            ),
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(
              right: 10,
            ),
            child: GestureDetector(
              onTap: () async {
                print(await eventController.htmlController.getText());
              },
              child: Icon(
                Icons.save,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      body: Form(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildInputTextFormField(
                  label: 'Event Name*',
                  hintText: 'Name of the event',
                ),
                const SizedBox(height: 15),
                Obx(() {
                  if (eventController.isContainedImage()) {
                    return _buildImageDisplay(
                        label: 'Banner*',
                        onTapHandler: eventController.showImageDialog);
                  }

                  return _buildUploadImage(
                    context,
                    label: 'Banner*',
                    content: 'Upload Image',
                    onTapHandler: eventController.showImageDialog,
                  );
                }),
                const SizedBox(height: 15),
                _buildTextEditor(
                  label: 'Description*',
                  controller: eventController.htmlController,
                ),
                const SizedBox(height: 15),
                _buildInputTextFormField(
                  label: 'Location*',
                  hintText: 'Location of the event',
                ),
                const SizedBox(height: 15),
                _buildDateTextFormFieldsInRow(
                  firstLabel: 'Registration start*',
                  secondLabel: 'Registration end*',
                  hintText: 'dd/MM/yyyy',
                  firstOnTapHandler: () {
                    eventController.showDatePicker();
                  },
                  secondOnTapHandler: () {
                    eventController.showDatePicker();
                  },
                ),
                const SizedBox(height: 15),
                _buildDateTextFormFieldsInRow(
                  firstLabel: 'Event start*',
                  secondLabel: 'Event end*',
                  hintText: 'dd/MM/yyyy',
                  firstOnTapHandler: () {
                    eventController.showDatePicker();
                  },
                  secondOnTapHandler: () {
                    eventController.showDatePicker();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label,
      required String hintText,
      TextEditingController? controller,
      VoidCallback? onTapHandler,
      bool readOnly = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8.0),
        TextFormField(
          readOnly: readOnly,
          onTap: onTapHandler,
          controller: controller,
          style: TextStyle(fontSize: 13),
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextEditor({
    required String label,
    required HtmlEditorController controller,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 8.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                HtmlEditor(
                  htmlToolbarOptions: HtmlToolbarOptions(
                    toolbarPosition: ToolbarPosition.belowEditor,
                    defaultToolbarButtons: [
                      FontButtons(),
                      StyleButtons(),
                      ListButtons(listStyles: false),
                    ],
                  ),
                  controller: controller, //required
                  htmlEditorOptions: HtmlEditorOptions(
                    hint: "Your event content...",
                  ),
                  otherOptions: OtherOptions(
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputTextFormField(
      {required String label,
      required String hintText,
      TextEditingController? controller}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: _buildTextField(
        label: label,
        hintText: hintText,
        controller: controller,
      ),
    );
  }

  Widget _buildDateTextFormFieldsInRow({
    required String firstLabel,
    required String secondLabel,
    required String hintText,
    TextEditingController? firstController,
    TextEditingController? secondController,
    VoidCallback? firstOnTapHandler,
    VoidCallback? secondOnTapHandler,
  }) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              left: 40,
              right: 10,
            ),
            child: _buildTextField(
              label: firstLabel,
              hintText: hintText,
              controller: firstController,
              onTapHandler: firstOnTapHandler,
              readOnly: true,
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              right: 40,
              left: 10,
            ),
            child: _buildTextField(
              label: secondLabel,
              hintText: hintText,
              controller: secondController,
              onTapHandler: secondOnTapHandler,
              readOnly: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadImage(BuildContext context,
      {required String label,
      required String content,
      VoidCallback? onTapHandler}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 8.0),
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            onTap: onTapHandler,
            child: Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFb5b0ac)),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: Color(0xFFb5b0ac),
                  ),
                  Text(
                    content,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageDisplay(
      {required String label, VoidCallback? onTapHandler}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 8.0),
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            onTap: onTapHandler,
            child: Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFb5b0ac)),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.file(
                  File(eventController.banner.value.path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
