import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/model/fooditem.dart';
import 'bloc/cartlistbloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: [
          Bloc((i) => CartListBloc()),
        ],
        dependencies: const [],
        child: const MaterialApp(
          title: 'Food Delivery',
          home: Home(),
          debugShowCheckedModeBanner: false,
        ));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: <Widget>[
        const FirstHalf(),
        const SizedBox(
          height: 45,
        ),
        for (var foodItem in fooditemList.foodItems)
          ItemContainer(foodItem: foodItem)
      ],
    )));
  }
}

class ItemContainer extends StatelessWidget {
  final FoodItem foodItem;
  ItemContainer({
    Key? key,
    required this.foodItem,
  }) : super(key: key);

  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  addToCart(FoodItem foodItem) {
    bloc.addTolist(foodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(foodItem);
        final snackbar = SnackBar(
          content: Text("${foodItem.title} added to the cart"),
          duration: const Duration(milliseconds: 600),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      child: Items(
          hotel: foodItem.hotel,
          itemName: foodItem.title,
          itemPrice: foodItem.price,
          imgUrl: foodItem.imgUrl,
          leftAligned: (foodItem.id % 2 == 0) ? true : false),
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    Key? key,
    required this.leftAligned,
    required this.imgUrl,
    required this.itemPrice,
    required this.itemName,
    required this.hotel,
  }) : super(key: key);

  final bool leftAligned;
  final String imgUrl;
  final double itemPrice;
  final String itemName;
  final String hotel;

  @override
  Widget build(BuildContext context) {
    double containerPadding = 50;
    double containerBorderRadius = 20;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: leftAligned ? 0 : containerPadding,
            right: leftAligned ? containerPadding : 0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: leftAligned
                        ? const Radius.circular(0)
                        : Radius.circular(containerBorderRadius),
                    right: leftAligned
                        ? Radius.circular(containerBorderRadius)
                        : const Radius.circular(0),
                  ),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: leftAligned ? 20 : 0,
                  right: leftAligned ? 0 : 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            itemName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                        ),
                        Text(
                          "\$ $itemPrice",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black45, fontSize: 15),
                              children: [
                            const TextSpan(text: "by "),
                            TextSpan(
                                text: hotel,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700))
                          ])),
                    ),
                    SizedBox(height: containerPadding),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                      indent: 20.0,
                      endIndent: 20.0,
                    ),
                    SizedBox(height: containerPadding),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class FirstHalf extends StatelessWidget {
  const FirstHalf({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(children: <Widget>[
        CustomAppBar(),
        const SizedBox(
          height: 30,
        ),
        title(),
        const SizedBox(
          height: 30,
        ),
        searchBar(),
        const SizedBox(
          height: 30,
        ),
        categories(),
      ]),
    );
  }

  Widget categories() {
    return SizedBox(
      height: 185,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryname: "Burger",
            availabillity: 12,
            selected: true,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryname: "Pizza",
            availabillity: 12,
            selected: false,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryname: "Pizza",
            availabillity: 12,
            selected: false,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryname: "Pizza",
            availabillity: 12,
            selected: false,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryname: "Pizza",
            availabillity: 12,
            selected: false,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryname: "Pizza",
            availabillity: 12,
            selected: false,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryname: "Pizza",
            availabillity: 12,
            selected: false,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryname: "Pizza",
            availabillity: 12,
            selected: false,
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.search,
          color: Colors.black45,
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: TextField(
          decoration: InputDecoration(
              hintText: 'Search...',
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              hintStyle: TextStyle(color: Colors.black87)),
        ))
      ],
    );
  }

  Widget title() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 45),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Food",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            Text(
              'Delivery',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 30,
              ),
            )
          ],
        )
      ],
    );
  }
}

class CategoryListItem extends StatelessWidget {
  final IconData categoryIcon;
  final String categoryname;
  final int availabillity;
  final bool selected;
  const CategoryListItem({
    Key? key,
    required this.categoryIcon,
    required this.categoryname,
    required this.availabillity,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: selected ? const Color(0xfffeb324) : Colors.white,
        border: Border.all(
            color: selected ? Colors.transparent : Colors.grey, width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: selected ? Colors.transparent : Colors.grey,
                    width: 1.5)),
            child: Icon(
              categoryIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            categoryname,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            availabillity.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key});
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Icon(Icons.menu),
          StreamBuilder(
            stream: bloc.listStream,
            builder: (context, snapshot) {
              List<FoodItem>? foodItems = snapshot.data;
              int length = foodItems != null ? foodItems.length : 0;

              return buildGestureDetector(length);
            },
          )
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector(int length) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 30),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.yellow[800], borderRadius: BorderRadius.circular(50)),
        child: Text(length.toString()),
      ),
    );
  }
}
