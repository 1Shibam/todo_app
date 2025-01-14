import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/items.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<Items>>((ref) {
  return ItemNotifier();
});

//the class below is extending state notifier i.e,
class ItemNotifier extends StateNotifier<List<Items>> {
  // state notifier always needs a state here its list of Items class
  //
  ItemNotifier() : super([]);

  //add item to the list
  void addItem(String itemName) {
    final item = Items(id: DateTime.now().toString(), name: itemName);
    state.add(item);
    state = state.toList();
    
  }

  //delete data in the list
  void deleteItem() {}

  //update data in the list
  void updateItem() {}

  //read data present in the list
  void lookItem() {}
}
