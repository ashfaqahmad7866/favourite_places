import 'package:favourite_places/models/place.dart';
import 'package:flutter/material.dart';

class PlacesDetails extends StatelessWidget {
  const PlacesDetails({super.key, required this.place});
  final PlaceData place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Stack(children: [
        Image.file(
          place.image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        )
      ]),
    );
  }
}
