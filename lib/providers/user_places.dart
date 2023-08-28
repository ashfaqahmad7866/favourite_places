import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favourite_places/models/place.dart';

class UserPlacesNotifier extends StateNotifier<List<PlaceData>> {
  UserPlacesNotifier() : super([]);
  void addPlace(String title) {
    final userPlace = PlaceData(name: title);
    state = [userPlace, ...state];
  }
}

final userPlacesNotifier =
    StateNotifierProvider<UserPlacesNotifier, List<PlaceData>>(
        (ref) => UserPlacesNotifier());
