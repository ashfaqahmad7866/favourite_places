// ignore_for_file: unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:favourite_places/models/place.dart';
class NewPlaces extends StatefulWidget {
  const NewPlaces({super.key});

  @override
  State<NewPlaces> createState() => _NewPlacesState();
}

class _NewPlacesState extends State<NewPlaces> {
  void savePlaces() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.of(context).pop(PlaceData(name: placeName)); 
    }
  }

  var placeName;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  decoration: const InputDecoration(
                    label: Text('Enter place name'),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        value == null ||
                        value.trim().length <= 5) {
                      return 'Place name can\'t be null';
                    }
                    return null;
                  },
                  onSaved: (newValue) => placeName=newValue,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: savePlaces,
                        icon: const Icon(Icons.add),
                        label: const Text('Add Place'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}