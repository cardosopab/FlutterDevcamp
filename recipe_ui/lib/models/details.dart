import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipe_ui/models/recipe.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  Recipe recipe;
  int homeIndex;
  DetailsPage({required this.recipe, required this.homeIndex, super.key});
  Future<void> _launchUrl(url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not laugh $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: homeIndex.isEven ? const Color(0xffee8b5c) : const Color(0xffaf7485),
        actions: const [
          Icon(Icons.notifications_outlined),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width,
                  color: homeIndex.isEven ? const Color(0xffee8b5c) : const Color(0xffaf7485),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            // flex: 6,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    recipe.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const WidgetSpan(
                                          child: Icon(
                                            Icons.access_time_filled,
                                            // size: iconSize,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " ${recipe.cookTime} mins",
                                          style: const TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const WidgetSpan(
                                          child: Icon(
                                            Icons.person,
                                            // size: iconSize,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " ${recipe.servings} servings",
                                          style: const TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Chef: ${recipe.author}",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Check out their Website',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // decoration: TextDecoration.underline,
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              await _launchUrl(recipe.resUrl);
                                            },
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            // flex: 4,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              height: MediaQuery.of(context).size.height * .5,
                              // child: Image.asset(recipe.picUrl),
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        // alignment: Alignment.topRight,
                        right: -50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.asset(
                            recipe.picUrl,
                            fit: BoxFit.cover,
                            height: 275,
                            width: 275,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Ingredients",
                  style: TextStyle(color: Color(0xff2f5a70), fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 4,
                  crossAxisCount: 2,
                  children: List.generate(
                    recipe.ingredients.length,
                    (index) {
                      String ingredients = recipe.ingredients[index];
                      return RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '⦿ ',
                              style: TextStyle(
                                fontSize: 15,
                                color: homeIndex.isEven ? const Color(0xffee8b5c) : const Color(0xffaf7485),
                              ),
                            ),
                            TextSpan(
                              text: ingredients,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Instructions",
                  style: TextStyle(color: Color(0xff2f5a70), fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recipe.instructions.length,
                  itemBuilder: (context, index) {
                    int order = 1 + index;
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        "$order, ${recipe.instructions[index]}",
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 60,
          backgroundColor: Colors.white,
        ),
        child: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.grey,
                ),
                label: "home"),
            NavigationDestination(
                icon: Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                ),
                label: "favorite"),
            NavigationDestination(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                label: "search"),
            NavigationDestination(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
                label: "person"),
          ],
        ),
      ),
    );
  }
}
