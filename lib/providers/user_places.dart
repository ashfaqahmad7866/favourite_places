import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favourite_places/models/place.dart';
import 'dart:io';

class UserPlacesNotifier extends StateNotifier<List<PlaceData>> {
  UserPlacesNotifier() : super([]);
  void addPlace(String title,File image) {
    final userPlace = PlaceData(name: title,image: image);
    state = [userPlace, ...state];
  }
}

final userPlacesNotifier =
    StateNotifierProvider<UserPlacesNotifier, List<PlaceData>>(
        (ref) => UserPlacesNotifier());
