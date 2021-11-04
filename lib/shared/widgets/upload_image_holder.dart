import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageHolder extends StatefulWidget {
  final String label;
  final String content;
  final String errorContent;

  UploadImageHolder({
    required this.label,
    required this.content,
    this.errorContent = 'Please choose an image',
    Key? key,
  }) : super(key: key);

  @override
  UploadImageHolderState createState() => UploadImageHolderState();
}

class UploadImageHolderState extends State<UploadImageHolder> {
  final ImagePicker _picker = ImagePicker();
  XFile? banner;
  bool isError = false;

  File? getImage() {
    if(banner == null) return null;
    return File(banner!.path);
  }

  bool validate() {
    setState(() {
      isError = banner == null;
    });
    return !isError;
  }

  void _showImageDialog() async {
    XFile? _banner = await _picker.pickImage(source: ImageSource.gallery);
    if (_banner == null) return;
    setState(() {
      banner = _banner;
    });
  }

  @override
  Widget build(BuildContext context) {
    return banner == null
        ? _buildUploadImage(context,
            label: widget.label,
            content: widget.content,
            errorContent: widget.errorContent,
            onTapHandler: _showImageDialog)
        : _buildImageDisplay(
            label: widget.label,
            fileName: banner!.path,
            onTapHandler: _showImageDialog,
          );
  }

  Widget _buildUploadImage(BuildContext context,
      {required String label,
      required String content,
      required String errorContent,
      VoidCallback? onTapHandler}) {
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
            style: TextStyle(
              color: isError ? Colors.red : Colors.black,
            ),
          ),
          const SizedBox(height: 8.0),
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            onTap: onTapHandler,
            child: Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isError ? Colors.red : Color(0xFFb5b0ac),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: isError ? Colors.red : Color(0xFFb5b0ac),
                  ),
                  isError
                      ? Text(
                          errorContent,
                          style: TextStyle(color: Colors.red),
                        )
                      : Text(content),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageDisplay(
      {required String label, VoidCallback? onTapHandler, String? fileName}) {
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
                  File(fileName!),
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
