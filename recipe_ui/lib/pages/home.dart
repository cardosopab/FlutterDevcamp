import 'package:flutter/material.dart';
import 'package:recipe_ui/models/recipe.dart';

import '../models/details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 15;
    List<Recipe> recipes = [];
    List list = ["ENTRES", "APPS", "SOUPS", "SALADS", "SNACKS"];
    for (var data in recipeJson) {
      Recipe obj = Recipe(
        name: data['name'],
        author: data['author'],
        picUrl: data['picUrl'],
        resUrl: data['resUrl'],
        cookTime: data['cookTime'],
        servings: data['servings'],
        reviews: data['reviews'],
        ingredients: data['ingredients'],
        instructions: data['instructions'],
      );
      recipes.add(obj);
    }
    return Scaffold(
      backgroundColor: const Color(0xff2f5a70),
      appBar: AppBar(
        leading: const Icon(Icons.sort),
        actions: const [Icon(Icons.notifications_none)],
        backgroundColor: const Color(0xff2f5a70),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Greetings, Pablo"),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "What do you want to cook today?",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextField(
                    cursorColor: const Color(0xff2f5a70),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintText: "Search Recipes",
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.white))),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Most Popular Recipes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: recipeJson.length,
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailsPage(
                                      homeIndex: index,
                                      recipe: recipe,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Container(
                                    color: index.isEven ? const Color(0xffee8b5c) : const Color(0xffaf7485),
                                    height: 250,
                                    width: 175,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 100,
                                        ),
                                        Text(
                                          recipe.name,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.access_time_filled,
                                              size: iconSize,
                                            ),
                                            Text(
                                              "${recipe.cookTime} mins",
                                              style: const TextStyle(fontSize: 10),
                                            ),
                                            Icon(
                                              Icons.person,
                                              size: iconSize,
                                            ),
                                            Text(
                                              "${recipe.servings} servings",
                                              style: const TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        Wrap(
                                          children: List<Widget>.generate(
                                              5,
                                              (index) => Icon(
                                                    Icons.star,
                                                    size: iconSize,
                                                  )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: -5,
                                  top: -5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(125),
                                    child: Image.asset(
                                      recipe.picUrl,
                                      height: 130,
                                      width: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Row(
                  children: [
                    const Icon(Icons.settings_input_component_outlined),
                    SizedBox(
                      height: 90,
                      width: MediaQuery.of(context).size.width * .83,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                width: 70,
                                height: 70,
                                color: const Color(0xff1c3956),
                                child: Center(
                                  child: Text(list[index]),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 60,
          backgroundColor: Color(0xff2f5a70),
        ),
        child: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: "home"),
            NavigationDestination(icon: Icon(Icons.favorite_outline), label: "favorite"),
            NavigationDestination(icon: Icon(Icons.search), label: "search"),
            NavigationDestination(icon: Icon(Icons.person_outline), label: "person"),
          ],
        ),
      ),
    );
  }
}
