import 'package:flutter/material.dart';
import 'package:news_app/services/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keywordController = TextEditingController();
  final countryController = TextEditingController();
  final listTopicController = TextEditingController();
  final listTopicFocusNode = FocusNode();
  final listScrollController = ScrollController();
  bool isPressed = false;
  @override
  void initState() {
    fetchHeadlines('us').then((value) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(actions: []),
        body: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: listScrollController,
                    // physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: savedCatagories.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: savedCatagories[index].length,
                                itemBuilder: (context, index1) {
                                  String title =
                                      savedCatagories[index][index1].title!;
                                  String urlToImage = savedCatagories[index]
                                              [index1]
                                          .urlToImage ??
                                      '';
                                  return Column(
                                    children: [
                                      Stack(
                                        children: [
                                          ColorFiltered(
                                            colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.3),
                                                BlendMode.dstATop),
                                            child: FadeInImage.assetNetwork(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .6,
                                              fit: BoxFit.cover,
                                              placeholder: 'assets/pc_300.png',
                                              image: urlToImage,
                                              imageErrorBuilder:
                                                  (context, error, stacktrace) {
                                                return Image.asset(
                                                  'assets/pc_300.png',
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .6,
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .7,
                                              child: Text(
                                                title,
                                                textAlign: TextAlign.end,
                                                style: const TextStyle(
                                                    color: Colors.tealAccent,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .7,
                                        child: const Divider(
                                          height: 40,
                                          color: Colors.teal,
                                          thickness: 2,
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      // textStyle: TextStyle(color: Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.tealAccent)),
                                  onPressed: () {
                                    savedCatagories.removeAt(index);
                                    setState(() {});
                                  },
                                  child: const Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                // isPressed
                                //     ? GestureDetector(
                                //         onTap: () {
                                //           isPressed = !isPressed;
                                //         },
                                //         child:
                                Text(
                                  savedKeywords[index]
                                          .toString()[0]
                                          .toUpperCase() +
                                      savedKeywords[index]
                                          .substring(1)
                                          .toLowerCase(),
                                ),
                                //       )
                                //     : Padding(
                                //         padding:
                                //             const EdgeInsets.only(right: 10),
                                //         child: EditableText(
                                //           controller: listTopicController,
                                //           focusNode: listTopicFocusNode,
                                //           cursorColor: Colors.teal,
                                //           backgroundCursorColor: Colors.black,
                                //           style: const TextStyle(
                                //               color: Colors.tealAccent,
                                //               fontSize: 20,
                                //               fontWeight: FontWeight.bold),
                                //         ),
                                //       ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: () {
                  String dropDownValue = 'US';
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Headline Search'),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextField(
                              controller: keywordController,
                            ),
                            // DropdownButton(
                            //   value: _dropDownValue,
                            //   hint: const Text('Country'),
                            //   items: countryList
                            //       .map(
                            //         (e) => DropdownMenuItem<String>(
                            //           value: e.toString().toUpperCase(),
                            //           child: Text(e.toString().toUpperCase()),
                            //         ),
                            //       )
                            //       .toList(),
                            //   onChanged: (value) {
                            //     if (value != null) {
                            //       countryController.text = value;
                            //     }
                            //   },
                            // ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            await fetchEverything(keywordController.text).then(
                                (_) {
                              setState(() {});
                              keywordController.text = '';
                              Navigator.of(context).pop();
                            }).then((_) => listScrollController.animateTo(
                                listScrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.fastOutSlowIn));
                          },
                          child: const Text('Search'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
