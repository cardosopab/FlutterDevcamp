import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/services/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //set initial Orientation to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    fecthNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const [],
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
                            TextButton(
                                onPressed: () {
                                  savedCatagories.removeAt(index);
                                  setState(() {});
                                },
                                child: const Text("Delete")),
                            Expanded(
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: savedCatagories[index].length,
                                itemBuilder: (context, index1) {
                                  return Text(
                                    savedCatagories[index][index1].title!,
                                  );
                                },
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
            // FutureBuilder(
            //   future: fecthNews(),
            //   builder: (context, AsyncSnapshot<List<Articles>> snapshot) {
            //     if (snapshot.hasData) {
            //       List<Articles> articles = snapshot.data!;
            //       return ListView.builder(
            //         shrinkWrap: true,
            //         itemCount: articles.length,
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //             title: Text(articles[index].title.toString()),
            //           );
            //         },
            //       );
            //     }
            //     return const Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   },
            // ),
            Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: () {
                  fecthNews();
                  setState(() {});
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
