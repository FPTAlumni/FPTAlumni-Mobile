import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:uni_alumni/modules/events/event_controller.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';
import 'package:uni_alumni/shared/widgets/upload_image_holder.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final GlobalKey<UploadImageHolderState> _imageHolderKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final eventController = Get.find<EventController>();
  bool _isEventNameValid = true;
  bool _isValidContent = true;
  String? _contentErrorMsg;
  bool _isValidLocation = true;
  bool _isValidRegistrationStart = true;
  bool _isValidRegistrationEnd = true;
  bool _isValidEventStart = true;
  bool _isValidEventEnd = true;

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
                _formKey.currentState!.validate();

                //image validation
                _imageHolderKey.currentState!.validate();

                //content validation
                final _content =
                    await eventController.contentController.getText();
                _contentErrorMsg = _contentValidation(_content);
                if (_contentErrorMsg != null) {
                  setState(() {});
                }
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
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: [
                _buildInputTextFormField(
                  label: 'Event Name*',
                  hintText: 'Name of the event',
                  controller: eventController.eventNameController,
                  validator: _eventNameValidation,
                  isValid: _isEventNameValid,
                ),
                const SizedBox(height: 20),
                UploadImageHolder(
                  key: _imageHolderKey,
                  label: 'Banner*',
                  content: 'Upload Image',
                ),
                // Obx(() {
                //   if (eventController.isContainedImage()) {
                //     return _buildImageDisplay(
                //         label: 'Banner*',
                //         onTapHandler: eventController.showImageDialog);
                //   }
                //
                //   return _buildUploadImage(
                //     context,
                //     label: 'Banner*',
                //     content: 'Upload Image',
                //     onTapHandler: eventController.showImageDialog,
                //   );
                // }),
                const SizedBox(height: 20),
                _buildTextEditor(
                  label: 'Description*',
                  controller: eventController.contentController,
                ),
                const SizedBox(height: 20),
                _buildInputTextFormField(
                  label: 'Location*',
                  hintText: 'Location of the event',
                  controller: eventController.locationController,
                  validator: _locationValidation,
                  isValid: _isValidLocation,
                ),
                const SizedBox(height: 20),
                _buildDateTextFormFieldsInRow(
                  firstLabel: 'Registration start*',
                  firstOnTapHandler: () {
                    eventController.showDatePicker();
                  },
                  firstController: eventController.registrationStartController,
                  firstValidator: _registrationStartValidation,
                  isFirstValid: _isValidRegistrationStart,
                  secondLabel: 'Registration end*',
                  secondOnTapHandler: () {
                    eventController.showDatePicker();
                  },
                  secondController: eventController.registrationStartController,
                  secondValidator: _registrationEndValidation,
                  isSecondValid: _isValidRegistrationEnd,
                  hintText: 'dd/MM/yyyy',
                ),
                const SizedBox(height: 20),
                _buildDateTextFormFieldsInRow(
                  firstLabel: 'Event start*',
                  firstOnTapHandler: () {
                    eventController.showDatePicker();
                  },
                  firstController: eventController.eventStartController,
                  firstValidator: _eventStartValidation,
                  isFirstValid: _isValidEventStart,
                  secondLabel: 'Event end*',
                  secondOnTapHandler: () {
                    eventController.showDatePicker();
                  },
                  secondController: eventController.eventEndController,
                  secondValidator: _eventEndValidation,
                  isSecondValid: _isValidEventEnd,
                  hintText: 'dd/MM/yyyy',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _eventNameValidation(String? value) {
    String? error;
    if (value!.isEmpty) {
      error = 'Please enter event name';
    }

    setState(() {
      _isEventNameValid = error == null;
    });

    return error;
  }

  String? _contentValidation(String content) {
    String? error;
    if (content.isEmpty) {
      error = 'Please enter content';
    }

    setState(() {
      _isValidContent = content.isNotEmpty;
    });

    return error;
  }

  String? _locationValidation(String? value) {
    String? error;
    if (value!.isEmpty) {
      error = 'Please enter event location';
    }

    setState(() {
      _isValidLocation = error == null;
    });

    return error;
  }

  String? _registrationStartValidation(String? value) {
    String? error;
    if (value!.isEmpty) {
      error = 'Please enter registration start';
    }

    setState(() {
      _isValidRegistrationStart = error == null;
    });

    return error;
  }

  String? _registrationEndValidation(String? value) {
    String? error;
    if (value!.isEmpty) {
      error = 'Please enter registration end';
    }

    setState(() {
      _isValidRegistrationEnd = error == null;
    });

    return error;
  }

  String? _eventStartValidation(String? value) {
    String? error;
    if (value!.isEmpty) {
      error = 'Please enter event start date';
    }

    setState(() {
      _isValidEventStart = error == null;
    });

    return error;
  }

  String? _eventEndValidation(String? value) {
    String? error;
    if (value!.isEmpty) {
      error = 'Please enter event end date';
    }

    setState(() {
      _isValidEventEnd = error == null;
    });

    return error;
  }

  Widget _buildTextField(
      {required String label,
      required String hintText,
      TextEditingController? controller,
      VoidCallback? onTapHandler,
      bool readOnly = false,
      String? Function(String?)? validator,
      bool isValid = true}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: isValid ? Colors.black : Colors.red),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          validator: validator,
          readOnly: readOnly,
          onTap: onTapHandler,
          controller: controller,
          style: TextStyle(fontSize: 13),
          decoration: InputDecoration(
            hintText: hintText,
            errorStyle: errorText,
            errorMaxLines: 3,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
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
          Text(
            label,
            style:
                TextStyle(color: _isValidContent ? Colors.black : Colors.red),
          ),
          const SizedBox(height: 8.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: _isValidContent ? Colors.black : Colors.red),
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
          if (_contentErrorMsg != null)
            Padding(
              padding: EdgeInsets.only(
                top: 8,
                left: 10,
              ),
              child: Text(
                _contentErrorMsg!,
                style: errorText,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInputTextFormField(
      {required String label,
      required String hintText,
      TextEditingController? controller,
      String? Function(String?)? validator,
      bool isValid = true}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: _buildTextField(
        label: label,
        hintText: hintText,
        controller: controller,
        validator: validator,
        isValid: isValid,
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
    String? Function(String?)? firstValidator,
    String? Function(String?)? secondValidator,
    bool isFirstValid = true,
    bool isSecondValid = true,
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
              validator: firstValidator,
              isValid: isFirstValid,
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
              validator: secondValidator,
              isValid: isSecondValid,
              readOnly: true,
            ),
          ),
        ),
      ],
    );
  }

  final TextStyle errorText = TextStyle(
    color: Colors.red[700],
    fontSize: 12,
  );

  // Widget _buildUploadImage(BuildContext context,
  //     {required String label,
  //     required String content,
  //     VoidCallback? onTapHandler}) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(
  //       horizontal: 40,
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(label),
  //         const SizedBox(height: 8.0),
  //         InkWell(
  //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //           onTap: onTapHandler,
  //           child: Container(
  //             width: double.infinity,
  //             height: 180,
  //             decoration: BoxDecoration(
  //               border: Border.all(color: Color(0xFFb5b0ac)),
  //               borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //             ),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Icon(
  //                   Icons.camera_alt,
  //                   size: 50,
  //                   color: Color(0xFFb5b0ac),
  //                 ),
  //                 Text(
  //                   content,
  //                   style: Theme.of(context).textTheme.headline6,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildImageDisplay(
  //     {required String label, VoidCallback? onTapHandler}) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(
  //       horizontal: 40,
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(label),
  //         const SizedBox(height: 8.0),
  //         InkWell(
  //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //           onTap: onTapHandler,
  //           child: Container(
  //             width: double.infinity,
  //             height: 180,
  //             decoration: BoxDecoration(
  //               border: Border.all(color: Color(0xFFb5b0ac)),
  //               borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //             ),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //               child: Image.file(
  //                 File(eventController.banner.value.path),
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
