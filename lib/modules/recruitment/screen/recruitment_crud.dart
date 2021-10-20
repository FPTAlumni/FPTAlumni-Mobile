import 'package:flutter/material.dart';
import 'package:uni_alumni/shared/constants/colors.dart';
import 'package:uni_alumni/shared/widgets/sub_screen_app_bar.dart';

class RecruitmentCRUD extends StatelessWidget {
  const RecruitmentCRUD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      appBar: SubScreenAppBar(title: 'Create your job'),
      body: Container(
        child: Form(
          child: Column(
            children: [
              _buildTextFormField(label: 'Title'),
              _buildTextFormField(
                label: 'Description',
                textInputType: TextInputType.multiline,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    int? maxLines = 1,
    TextInputType textInputType = TextInputType.text,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 30.0,
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        keyboardType: textInputType,
        decoration: InputDecoration(
          label: Text(label),
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),
        ),
      ),
    );
  }
}
