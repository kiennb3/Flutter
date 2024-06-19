
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

final placesProvider =StateNotifierProvider<PlacesNotifier,List<Place>>((ref){
  return PlacesNotifier();
});

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier():super([]);

  void addPlace(Place place){
    state=[...state,place];
  }
  void removePlace(String id){
    state =state.where((place)=>place.id !=id).toList();
  }
}