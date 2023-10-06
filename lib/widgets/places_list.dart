import 'package:challenge_one/screens/place_detail.dart';
import 'package:flutter/material.dart';

import '../models/place.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    // ----------------------------------------------------------------
    // no places is empty control ??________________________
    // ----------------------------------------------------------------

    if (places.isEmpty) {
      return Center(
        child: Text(
          "No places added yet",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    // ----------------------------------------------------------------
    // return area ??________________________
    // ----------------------------------------------------------------

    return ListView.builder(
      itemCount: places.length,
      // ----------------------------------------------------------------
      // listtile ??________________________
      // ----------------------------------------------------------------
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image),
        ),
        // ----------------------------------------------------------------
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => PlaceDetailScreen(place: places[index]),
            ),
          );
        },
        // ----------------------------------------------------------------
        // listtile text control??________________________
        // ------------------------- title ---------------------------------------
        title: Text(
          places[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        // ------------------------- subtitle ---------------------------------------

        subtitle: Text(
          places[index].location.address,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
