import 'package:favourite_places/providers/user_places.dart';
import 'package:favourite_places/screens/new_places.dart';
import 'package:flutter/material.dart';
import 'package:favourite_places/screens/places_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Places extends ConsumerWidget {
  const Places({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesNotifier);
    void newPlace() async {
       Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return const NewPlaces();
          },
        ),
      );
    }

    Widget content = const Center(
      child: Text(
        'No place added yet!',
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Your Places'), actions: [
        IconButton(
          onPressed: newPlace,
          icon: const Icon(Icons.add),
        ),
      ]),
      body: userPlaces.isEmpty
          ? content
          : ListView.builder(
              itemCount: userPlaces.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () { 
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return  PlacesDetails(place: userPlaces[index],);
                        },
                      ),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar( radius: 26,backgroundImage:FileImage( userPlaces[index].image,)),
                    title: Text(
                      userPlaces[index].name,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
