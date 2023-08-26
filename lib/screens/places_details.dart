import 'package:favourite_places/place_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesDetails extends ConsumerWidget {
  const PlacesDetails({super.key,});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final dum=ref.read(placeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(dum.first.name),
      ),
    );
  }
}
