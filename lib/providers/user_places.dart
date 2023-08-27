import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favourite_places/models/place.dart';
class UserPlacesNotifier extends StateNotifier<List<PlaceData>>{
  UserPlacesNotifier():super([]);
  void addPlace(String title)
  {
    final user_place=PlaceData(name: title);
    state=[user_place,...state];
  }
}
final userPlacesNotifier=StateNotifierProvider<UserPlacesNotifier,List<PlaceData>>((ref) => UserPlacesNotifier());