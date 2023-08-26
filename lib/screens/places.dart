import 'package:favourite_places/main.dart';
import 'package:favourite_places/screens/new_places.dart';
import 'package:flutter/material.dart';
import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/screens/places_details.dart';

class Places extends StatefulWidget {
  const Places({super.key});

  @override
  State<Places> createState() => _PlacesState();
}

final List<PlaceData> dum = [];

class _PlacesState extends State<Places> {
  void newPlace() async {
    final placeName = await Navigator.of(context).push<PlaceData>(
      MaterialPageRoute(
        builder: (context) {
          return const NewPlaces();
        },
      ),
    );
    if (placeName == null) {
      return;
    }
    setState(() {
      dum.add(placeName);
    });
  }

  Widget content = const Center(
    child: Text(
      'No place added yet!',
      style: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Places'), actions: [
        IconButton(
          onPressed: newPlace,
          icon: const Icon(Icons.add),
        ),
      ]),
      body: dum.isEmpty
          ? content
          : ListView.builder(
              itemCount: dum.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const PlacesDetails();
                        },
                      ));
                    },
                    child: ListTile(
                      title: Text(
                        dum[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                      ),
                    ));
              },
            ),
    );
  }
}
