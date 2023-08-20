import 'package:favourite_places/new_places.dart';
import 'package:flutter/material.dart';

class Places extends StatefulWidget {
  const Places({super.key});

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  void newPlace() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const NewPlaces();
      },
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Places'), actions: [
        IconButton(
          onPressed: newPlace,
          icon: const Icon(Icons.add),
        ),
      ]),
      body: const Center(
        child: Text(
          'No place added yet!',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
