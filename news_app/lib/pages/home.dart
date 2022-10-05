import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/http.dart';
import '../widgets/article.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keywordController = TextEditingController();
  final countryController = TextEditingController();
  final listScrollController = ScrollController();

  late String dropDownValue;
  bool isPressed = false;
  @override
  void initState() {
    dropDownValue = 'US';
    fetchHeadlines(dropDownValue).then((_) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CarouselSlider(
                  items: headlines.map((article) {
                    String title = article.title!;
                    String urlToImage = article.urlToImage ?? '';
                    return Builder(
                      builder: (context) {
                        return ArticleWidget(
                          urlToImage: urlToImage,
                          title: title,
                          url: article.url,
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * .35,
                    aspectRatio: 1 / 1,
                    viewportFraction: .90,
                  ),
                ),
                savedCatagories.isEmpty
                    ? Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Let's start searching!",
                              style: TextStyle(
                                  color: Colors.purpleAccent, fontSize: 40),
                            ),
                          ),
                          Image.asset('assets/pc_300.png'),
                        ],
                      )
                    // : CarouselSlider(
                    //     items: savedCatagories.asMap().entries.map((list) {
                    //       int idx = list.key;
                    //       return ListView.builder(
                    //           itemCount: savedCatagories[idx].length,
                    //           itemBuilder: (context, index) {
                    //             String urlToImage =
                    //                 savedCatagories[idx][index].urlToImage!;
                    //             String url = savedCatagories[idx][index].url!;
                    //             String title =
                    //                 savedCatagories[idx][index].title!;
                    //             return ArticleWidget(
                    //                 urlToImage: urlToImage,
                    //                 title: title,
                    //                 url: url);
                    //           });
                    //     }
                    //         // });
                    //         ).toList(),
                    //     options: CarouselOptions(
                    //       height: MediaQuery.of(context).size.height * .65,
                    //       aspectRatio: 1 / 1,
                    //       viewportFraction: 1,
                    //     ),
                    //   ),
                    : Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                controller: listScrollController,
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
                                            physics:
                                                const BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                savedCatagories[index].length,
                                            itemBuilder: (context, index1) {
                                              String title =
                                                  savedCatagories[index][index1]
                                                      .title!;
                                              String urlToImage =
                                                  savedCatagories[index][index1]
                                                          .urlToImage ??
                                                      '';
                                              return ArticleWidget(
                                                urlToImage: urlToImage,
                                                title: title,
                                                url: savedCatagories[index]
                                                        [index1]
                                                    .url,
                                              );
                                            },
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.purpleAccent)),
                                              onPressed: () {
                                                savedCatagories.removeAt(index);
                                                savedKeywords.removeAt(index);
                                                setState(() {});
                                              },
                                              child: const Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Text(
                                              savedKeywords[index]
                                                      .toString()[0]
                                                      .toUpperCase() +
                                                  savedKeywords[index]
                                                      .substring(1)
                                                      .toLowerCase(),
                                              style: const TextStyle(
                                                  color: Colors.purpleAccent,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
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
                      ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: () {
                  countryController.text = '';
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, setAlertState) {
                        return AlertDialog(
                          title: const Text('Country'),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                DropdownButton(
                                  value: dropDownValue,
                                  hint: const Text('Country'),
                                  items: countryList
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: e.toString().toUpperCase(),
                                          child:
                                              Text(e.toString().toUpperCase()),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      countryController.text = value;
                                      dropDownValue = value;
                                      setAlertState(() {});
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                if (countryController.text != '') {
                                  await fetchHeadlines(countryController.text)
                                      .then(
                                    (_) {
                                      Navigator.of(context).pop();
                                      setState(() {});
                                    },
                                  );
                                }
                              },
                              child: const Text(
                                'Update',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      });
                    },
                  );
                },
                child: const Icon(Icons.settings),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: () {
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
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            await fetchKeyword(keywordController.text)
                                .then((_) {
                              setState(() {});
                              keywordController.text = '';
                              Navigator.of(context).pop();
                            }).then(
                              (_) =>
                                  WidgetsBinding.instance.addPostFrameCallback(
                                (_) {
                                  if (listScrollController.hasClients) {
                                    listScrollController.animateTo(
                                      listScrollController
                                          .position.maxScrollExtent,
                                      duration:
                                          const Duration(milliseconds: 600),
                                      curve: Curves.fastOutSlowIn,
                                    );
                                  }
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Search',
                            style: TextStyle(color: Colors.white),
                          ),
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
