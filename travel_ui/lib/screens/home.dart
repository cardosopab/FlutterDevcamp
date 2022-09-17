import 'package:flutter/material.dart';

import '../models/destination.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double containerHeight = 40;
  double containerWidth = 100;
  List<Destination> destinationList = [];
  List<Map> json = [
    {'name': 'London', 'url': 'https://tse4.mm.bing.net/th?id=OIP.mYVWAnMfD0qVq7dadvQgiQAAAA&pid=Api'},
    {'name': 'Prague', 'url': 'https://tse2.mm.bing.net/th?id=OIP.ilnkXQNRP1Ke83ZzPhNQYQHaE7&pid=Api'},
    {'name': 'Barcelona', 'url': 'https://tse4.mm.bing.net/th?id=OIP.KI33XCpX8c59LPNNoxqVnAAAAA&pid=Api'},
    {'name': 'Munich', 'url': 'https://tse3.mm.bing.net/th?id=OIP.e2u--9WS9BxLvpFkHbrW_wHaE8&pid=Api'},
    {'name': 'Amsterdam', 'url': 'https://tse4.mm.bing.net/th?id=OIP.d-WApweEdioLojzGs0RlgAAAAA&pid=Api'},
    {'name': 'Tokyo', 'url': 'https://tse3.mm.bing.net/th?id=OIP.wFc_MVC5TfM9DsIGTblXcgHaEo&pid=Api'},
    {'name': 'Paris', 'url': 'https://tse1.mm.bing.net/th?id=OIP.YbrhUvndIHfKXi_XwpeLEgAAAA&pid=Api'},
    {'name': 'Lisbon', 'url': 'https://tse3.mm.bing.net/th?id=OIP.MYBLhPf28AFezm-5lSnaZwAAAA&pid=Api'},
  ];
  @override
  Widget build(BuildContext context) {
    double imageGridWidth = MediaQuery.of(context).size.width * .4;
    double imageGridHeight = imageGridWidth * .75;
    double textGridHeight = imageGridWidth * .25;
    for (var data in json) {
      Destination obj = Destination(
        name: data['name'],
        url: data['url'],
      );
      destinationList.add(obj);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        centerTitle: true,
        title: const Text("Travel App"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(),
              Image.network(
                  "https://img.freepik.com/premium-vector/travel-worldwide-vector-background-design-let-s-go-travel-text-blue-map-with-airplane-compass_572293-2569.jpg?w=996"),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Attractions",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Places",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Hotels",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Popular Destinations",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(
                  destinationList.length,
                  (index) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.network(
                            width: imageGridWidth,
                            height: imageGridHeight,
                            destinationList[index].url,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.teal.shade400,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          height: textGridHeight,
                          width: imageGridWidth,
                          child: Center(
                              child: Text(
                            destinationList[index].name,
                            style: const TextStyle(color: Colors.white),
                          )),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
