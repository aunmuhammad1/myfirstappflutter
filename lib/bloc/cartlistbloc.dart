import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:myfirstapp/bloc/provider.dart';
import 'package:myfirstapp/model/fooditem.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {
  var listController = BehaviorSubject<List<FoodItem>>.seeded([]);

  CartProvider provider = CartProvider();

  Stream<List<FoodItem>> get listStream => listController.stream;

  Sink<List<FoodItem>> get listSink => listController.sink;

  addTolist(FoodItem foodItem) {
    listSink.add(provider.addToList(foodItem));
  }

  removeFromList(FoodItem foodItem) {
    listSink.add(provider.removeFromList(foodItem));
  }

  @override
  void dispose() {
    // will be called automatically
    listController.close();
    super.dispose();
  }
}
