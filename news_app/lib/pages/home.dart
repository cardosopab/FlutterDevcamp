import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/services/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keywordController = TextEditingController();
  final countryController = TextEditingController();
  @override
  void initState() {
    //set initial Orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    fecthNews('us', 'google').then((value) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            // actions: const [],
            ),
        body: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: savedCatagories.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
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
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
                                          child: Text(
                                            title,
                                            style: const TextStyle(
                                                color: Colors.teal,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      FadeInImage.assetNetwork(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        fit: BoxFit.cover,
                                        placeholder: 'assets/pc_300.png',
                                        image: urlToImage,
                                        imageErrorBuilder:
                                            (context, error, stacktrace) {
                                          return Image.asset(
                                            'assets/pc_300.png',
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {
                                  savedCatagories.removeAt(index);
                                  setState(() {});
                                },
                                child: const Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.teal),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    // fecthNews().then((value) => setState(() {}));
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
                              DropdownButton(
                                hint: const Text('Country'),
                                items: countryList
                                    .map(
                                      (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    countryController.text = value;
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              fecthNews(countryController.text,
                                      keywordController.text)
                                  .then((value) => setState(() {}));
                              keywordController.text = '';
                              countryController.text = '';
                              Navigator.of(context).pop();
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
            ),
          ],
        ),
      ),
    );
  }
}
