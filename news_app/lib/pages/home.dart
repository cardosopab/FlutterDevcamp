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
  final listTopicController = TextEditingController();
  final listTopicFocusNode = FocusNode();
  final listScrollController = ScrollController();

  late String dropDownValue;
  bool isPressed = false;
  @override
  void initState() {
    fetchHeadlines('us').then((_) => setState(() {}));
    dropDownValue = 'US';
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
                      // print(article.url);
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
                    )),
                savedCatagories.isEmpty
                    ? Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Let's start searching!",
                              style: TextStyle(
                                  color: Colors.tealAccent, fontSize: 40),
                            ),
                          ),
                          Image.asset('assets/pc_300.png'),
                        ],
                      )
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
                                                          Colors.tealAccent)),
                                              onPressed: () {
                                                savedCatagories.removeAt(index);
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
                                                  color: Colors.tealAccent,
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
                                style: TextStyle(color: Colors.tealAccent),
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
