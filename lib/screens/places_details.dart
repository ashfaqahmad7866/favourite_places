import 'package:favourite_places/models/place.dart';
import 'package:flutter/material.dart';
class PlacesDetails extends StatelessWidget {
  const PlacesDetails({super.key,required this.place});
  final PlaceData place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(place.name),),
    body: Center(child: Text(place.name)),);
  }
}
