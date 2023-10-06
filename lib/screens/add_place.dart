import 'dart:io';

import 'package:challenge_one/models/place.dart';
import 'package:challenge_one/providers/user_places.dart';
import 'package:challenge_one/widgets/image_input.dart';
import 'package:challenge_one/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;
  void _savePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty ||
        _selectedImage == null ||
        _selectedLocation == null) {
      return;
    }

    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredTitle, _selectedImage!, _selectedLocation!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add new Place")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 10),
            ImageInput(onImagePicked: (image) {
              _selectedImage = image;
            }),
            const SizedBox(height: 10),
            LocationInput(onSelectLocation: (location) {
              setState(() {
                _selectedLocation = location;
              });
            }),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _savePlace,
              label: const Text("Add Place"),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}


