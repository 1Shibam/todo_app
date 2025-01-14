import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/items.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<Items>>((ref){
  return ItemNotifier();

});

//the class below is extending state notifier i.e,  
class ItemNotifier extends StateNotifier<List<Items>>{ // state notifier always needs a state here its list of Items class  
  ItemNotifier(): super([]);

} 