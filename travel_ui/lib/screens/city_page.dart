import 'package:flutter/material.dart';
import 'package:travel_ui/models/destination.dart';
import 'package:travel_ui/screens/places.dart';

class CityPage extends StatelessWidget {
  Destination city;
  CityPage({required this.city, super.key});
  double paddingSize = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        centerTitle: true,
        title: Text(city.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              city.url,
              // height: ,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(paddingSize),
              child: const Text(
                "Popular Places",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: city.places!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlacesPage(place: city.places![index]),
                                  ),
                                );
                              },
                              child: Image.network(
                                city.places![index].url!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              city.places![index].name!,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(paddingSize, 8, paddingSize, paddingSize),
              child: Text(
                city.description,
                style: const TextStyle(wordSpacing: 2, height: 1.5, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
