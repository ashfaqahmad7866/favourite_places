import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favourite_places/models/place.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as systempaths;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class UserPlacesNotifier extends StateNotifier<List<PlaceData>> {
  Future<Database> _getDatabse() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY ,title TEXT,image TEXT)');
  }, version: 1);
  return db;
}
  Future<void> loadPlaces() async {
  final db = await _getDatabse();
  final data = await db.query('user_places');
 final places= data
      .map(
        (row) => PlaceData(
          id: row['id'],
          name: row['title'] as String,
          image: File(row['image'] as String),
        ),
      )
      .toList();
      state=places;
}
  UserPlacesNotifier() : super([]);
  void addPlace(String title, File image) async {
    final appDir = await systempaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$fileName');
    final userPlace = PlaceData(name: title, image: copiedImage);
    final db = await _getDatabse();
    db.insert('user_places', {
      'id': userPlace.id,
      'title': userPlace.name,
      'image': userPlace.image.path
    });
    state = [userPlace, ...state];
  }
}

final userPlacesNotifier =
    StateNotifierProvider<UserPlacesNotifier, List<PlaceData>>(
        (ref) => UserPlacesNotifier());
