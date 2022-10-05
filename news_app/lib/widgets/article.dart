import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleWidget extends StatelessWidget {
  var url;

  ArticleWidget({
    Key? key,
    required this.urlToImage,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String urlToImage;
  final String title;
  Future<void> _launchUrl(url) async {
    Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(urlToImage);
        _launchUrl(url);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            FadeInImage.assetNetwork(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder: 'assets/pc_300.png',
              image: urlToImage,
              imageErrorBuilder: (context, error, stacktrace) {
                return Image.asset(
                  'assets/pc_300.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                );
              },
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.7),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                  ),
                ),
                width: MediaQuery.of(context).size.width * .7,
                child: Text(
                  title,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
