import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onImagePicked});

  final void Function(File image) onImagePicked;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();

    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });

    widget.onImagePicked(_selectedImage!);
  }

  void _galleryPicture() async {
    final imagePicker = ImagePicker();

    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          icon: const Icon(Icons.camera_alt_rounded),
          label: const Text('Take picture'),
          onPressed: _takePicture,
        ),
        TextButton.icon(
          icon: const Icon(Icons.photo),
          label: const Text('Gallery'),
          onPressed: _galleryPicture,
        ),
      ],
    );

    if (_selectedImage != null) {
      content = Stack(
        children: [
          Image.file(
            _selectedImage!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          if (_selectedImage != null)
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 3,
                ),
                onPressed: _takePicture,
                label: const Text("repeat picture"),
                icon: const Icon(Icons.camera_alt_rounded),
              ),
            ),
        ],
      );
    }
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  width: 3)),
          alignment: Alignment.center,
          height: 250,
          width: double.infinity,
          child: content,
        ),
      ],
    );
  }
}
