FooditemList fooditemList = FooditemList(foodItems: [
  FoodItem(
      id: 1,
      title: "Veggie burger",
      hotel: "René Redzepi",
      price: 14.49,
      imgUrl:
          'https://www.thecookierookie.com/wp-content/uploads/2023/04/stovetop-burgers-recipe-2-650x813.jpg'),
  FoodItem(
      id: 2,
      title: "BBQ Burger",
      hotel: "KFC",
      price: 14.49,
      imgUrl:
          'https://www.finedininglovers.com/sites/g/files/xknfdk626/files/2022-05/Popl_burger.jpg'),
  FoodItem(
      id: 3,
      title: "BBQ Burger",
      hotel: "KFC",
      price: 14.49,
      imgUrl:
          'https://www.thecookierookie.com/wp-content/uploads/2023/04/stovetop-burgers-recipe-2-650x813.jpg'),
  FoodItem(
      id: 4,
      title: "BBQ Burger",
      hotel: "KFC",
      price: 14.49,
      imgUrl:
          'https://www.finedininglovers.com/sites/g/files/xknfdk626/files/2022-05/Popl_burger.jpg'),
  FoodItem(
      id: 5,
      title: "BBQ Burger",
      hotel: "KFC",
      price: 14.49,
      imgUrl:
          'https://www.thecookierookie.com/wp-content/uploads/2023/04/stovetop-burgers-recipe-2-650x813.jpg'),
]);

class FooditemList {
  List<FoodItem> foodItems;

  FooditemList({required this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String hotel;
  double price;
  String imgUrl;
  int quantity;

  FoodItem(
      {required this.id,
      required this.title,
      required this.hotel,
      required this.price,
      required this.imgUrl,
      this.quantity = 1});

  void incrementQuantity() {
    quantity = quantity + 1;
  }

  void decrementQuantity() {
    quantity = quantity - 1;
  }
}
