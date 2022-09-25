import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/destination.dart';

class PlacesPage extends StatelessWidget {
  Places place;
  PlacesPage({required this.place, super.key});

  @override
  Widget build(BuildContext context) {
    double paddingSize = 20;
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      appBar: AppBar(
        title: Text(place.name!),
        backgroundColor: Colors.teal.shade400,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              place.url!,
              // height: ,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(paddingSize, 8, paddingSize, paddingSize),
              child: Text(
                place.description!,
                style: const TextStyle(wordSpacing: 2, height: 1.5, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
