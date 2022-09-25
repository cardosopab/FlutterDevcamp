class Destination {
  late String name;
  late String url;
  late String description;
  late List<Places>? places;

  Destination({
    required this.name,
    required this.url,
    required this.description,
    required this.places,
  });

  Destination.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    description = json['description'];
    if (json['places'] != null) {
      places = <Places>[];
      json['places'].forEach((v) {
        places!.add(new Places.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['description'] = this.description;
    if (this.places != null) {
      data['places'] = this.places!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Places {
  String? name;
  String? url;
  String? description;

  Places({this.name, this.url, this.description});

  Places.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['description'] = this.description;
    return data;
  }
}

List<Destination> destinationList = [
  Destination(
    name: "London",
    url: "https://tse4.mm.bing.net/th?id=OIP.e-RS_hDul9pxThX0P67J2AHaEK&pid=Api",
    description:
        "London is the capital and largest city of England and the United Kingdom, with a population of just over 9 million. It stands on the River Thames in south-east England at the head of a 50-mile estuary down to the North Sea, and has been a major settlement for two millennia.",
    places: [
      Places(
        name: "London Eye",
        url: "https://tse4.mm.bing.net/th?id=OIP.QusRDZzTYI7F4taFw0K0PwHaFj&pid=Api",
        description:
            "A trip on the London Eye is truly captivating, a 'must-do' and has been London's number one visitor experience for over a decade. Elegantly rotating over the River Thames and less than a five minute stroll from Waterloo station along the beautiful Southbank.",
      ),
      Places(
        name: "Big Ben",
        url: "https://tse2.mm.bing.net/th?id=OIP.03YRzq_Dn0bdSqs99k_6lQHaFj&pid=Api",
        description:
            " Elizabeth Tower is the name of the famous clock tower which stands at the Houses of Parliament. The name Big Ben is often used to describe the tower, the clock and the bell but the name was first given to the Great Bell.",
      ),
      Places(
        name: "Tower Bridge",
        url: "https://tse3.mm.bing.net/th?id=OIP.PtCvS-U1Gnq63yiDlfA4hwHaF_&pid=Api",
        description:
            "An iconic London landmark and one of Britain\"s best loved historic sites, Tower Bridge is open to the public 363 days a year. Within the Bridge\"s iconic structure and magnificent Victorian Engine rooms, the Tower Bridge Exhibition is the best way of exploring the most famous bridge in the world!",
      ),
      Places(
        name: "Stonehenge",
        url: "https://tse4.mm.bing.net/th?id=OIP.dOq3JTjiJeQLh2MZELnQcwHaEv&pid=Api",
        description:
            "Prehistoric stone circle monument, cemetery, and archaeological site located on Salisbury Plain, about 8 miles (13 km) north of Salisbury, Wiltshire, England. Though there is no definite evidence as to the intended purpose of Stonehenge, it was presumably a religious site and an expression of the power and wealth of the chieftains, aristocrats, and priests who had it built.",
      ),
    ],
  ),
  Destination(
    name: "Prague",
    url: "https://tse2.mm.bing.net/th?id=OIP.ilnkXQNRP1Ke83ZzPhNQYQHaE7&pid=Api",
    description:
        "Prague is the capital and largest city in the Czech Republic, and the historical capital of Bohemia. On the Vltava river, Prague is home to about 1.3 million people. The city has a temperate oceanic climate, with relatively warm summers and chilly winters. Political, cultural, and economic hub of central Europe, with a rich history and Romanesque, Gothic, Renaissance and Baroque architectures. It was the capital of the Kingdom of Bohemia and residence of several Holy Roman Emperors, most notably Charles IV",
    places: [
      Places(
        name: "Charles Bridge",
        url: "https://tse1.mm.bing.net/th?id=OIP.Fd1uN2Xy6NJExD7lW2IprQAAAA&pid=Api",
        description:
            "Charles Bridge is a medieval stone arch bridge that crosses the Vltava river in Prague, Czech Republic.Its construction started in 1357 under the auspices of King Charles IV, and finished in the early 15th century. The bridge replaced the old Judith Bridge built 1158–1172 that had been badly damaged by a flood in 1342.",
      ),
      Places(
        name: "The Astronomical Clock",
        url: "https://misstourist.com/wp-content/uploads/2015/11/2.jpg",
        description:
            "The Astronomical Clock Prague Czech Republic is on the Old Town Hall Tower, on the southern side. The Astronomical Clock Prague address is Staroměstské náměstí 1/3, which puts the tower right in the midst of the Old Town area. When you take a tour that includes this area, you are likely to be able to see the clock and tower very easily.",
      ),
      Places(
        name: "Dancing House",
        url: "https://img.theculturetrip.com/768x/smart/wp-content/uploads/2018/10/cre667-1.jpg",
        description:
            "Officially known as the Nationale-Nederlanden building, the Frank Gehry-designed Dancing House (or ‘Fred and Ginger’, after the famous dancers) was completed in 1996 and immediately became one of the most photographed buildings in the city. Designed in the deconstructivist or new-baroque style, the building consists of two towers (resembling two dancers). The ‘male tower’ is a cement tower that connects to an undulating section and is topped by a metal structure nicknamed Medusa, while the ‘female’ tower is made of glass and curved pillars. The building is used as offices and cannot be entered by the public—however, there is the Ginger & Fred restaurant on the top floor, with a magnificent view of the Vltava River below.",
      ),
      Places(
        name: "Žižkov TV Tower",
        url: "https://tse2.mm.bing.net/th?id=OIP.svDfDrwNlRLJfLaLP_fenwHaE9&pid=Api",
        description:
            "The Žižkov Television Tower is a transmitter tower built in Prague between 1985 and 1992. Designed by the architect Václav Aulický and the structural engineer Jiří Kozák, it stands high above the city's traditional skyline from its position on top of a hill in the district of Žižkov, from which it takes its name. The tower is an example of high-tech architecture.",
      ),
      Places(
        name: "Barcode Babies",
        url: "https://misstourist.com/wp-content/uploads/2015/11/barcode-kids-prague.jpg",
        description:
            "Babies is a series of sculptures by Czech artist David Černý, In 2008 an eight-piece bronze series was installed on Kampa Island",
      ),
    ],
  ),
  Destination(
    name: "Amsterdam",
    url: "https://tse4.mm.bing.net/th?id=OIP.d-WApweEdioLojzGs0RlgAAAAA&pid=Api",
    description:
        "Amsterdam is the capital and most populous city of the Netherlands; with a population of 907,976 within the city proper, 1,558,755 in the urban area and 2,480,394 in the metropolitan area. Found within the Dutch province of North Holland, Amsterdam is colloquially referred to as the \"Venice of the North\".",
    places: [
      Places(
        name: "Jordaan",
        url: "https://www.iamsterdam.com/media/canals-and-cityscapes/street-corner-noordermarkt-koen-smilde-photography.jpg?w=977",
        description:
            "Often cited as Amsterdam’s most charming neighbourhood, wandering into the Jordaan feels like stepping back in time. Originally a working-class area, the Jordaan’s narrow streets and quaint buildings now make up one of Amsterdam’s most desirable quarters, dotted with independent art galleries, antique shops, courtyard gardens and atmospheric bars and restaurants. Ditch the map and lose yourself in the labyrinth of narrow lanes that sprawl eastwards from Prinsengracht canal known as the 9 Streets, one of Amsterdam's most rewarding shopping experiences. ",
      ),
      Places(
        name: "De Gooyer",
        url: "https://tse2.mm.bing.net/th?id=OIP.03YRzq_Dn0bdSqs99k_6lQHaFj&pid=Api",
        description:
            " There are eight remaining windmills in Amsterdam and the easiest to visit is De Gooyer in the Oostelijke Eilanden (Eastern Islands) neighbourhood. And this isn’t just any windmill – for under the sails of this striking landmark is Brouwerij ‘t IJ, an award-winning artisan microbrewery with a large outdoor drinking terrace and 30-minute guided tasting tours. ",
      ),
      Places(
        name: "Paradiso",
        url: "https://tse3.mm.bing.net/th?id=OIP.PtCvS-U1Gnq63yiDlfA4hwHaF_&pid=Api",
        description:
            "Whether you like listening to live music in a majestic concert hall or an intimate dive bar, Amsterdam has you covered in high style. Housed in a converted church, Paradiso has hosted iconic acts like The Rolling Stones and The Sex Pistols and continues to showcase a superb roster of international talent.",
      ),
      Places(
        name: "Royal Palace Amsterdam",
        url: "https://www.iamsterdam.com/media/ama/castles-gardens/muiderslot-vanuit-de-luchtmuiderslot.jpg?w=977",
        description:
            "There are many castles, palaces and fortresses in the Amsterdam Area that provide a window into the region’s regal past and will make you feel like the star of your own fairytale. The Royal Palace Amsterdam is King Willem-Alexander’s official reception palace where world leaders and heads of state are hosted and entertained, but it is also open to visitors much of the year.",
      ),
    ],
  ),
  Destination(
    name: "Tokyo",
    url: "https://tse3.mm.bing.net/th?id=OIP.wFc_MVC5TfM9DsIGTblXcgHaEo&pid=Api",
    description:
        "Tokyo, officially the Tokyo Metropolis, is the capital and largest city of Japan. Formerly known as Edo and historically called Tokio, its metropolitan area (spanning 13,452 square kilometres or 5,194 square miles) is the most populous in the world, with an estimated 37.468 million residents as of 2018; the city proper has a population of 13.99 million people.",
    places: [
      Places(
        name: "Meiji Jingu Shrine",
        url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/30/73/a4/photo3jpg.jpg?w=500&h=-1&s=1",
        description:
            "Set inside a spacious 100-year old park, the Meiji Jingu shrine includes a small cluster of buildings around a pedestrian plaza. There is a pavilion for guests to perform ritual purification by washing their hands (and mouths), and there is a kiosk where you can buy a little plaque on which to write a wish or a prayer and hang it up.",
      ),
      Places(
        name: "Shinjuku Gyoen National Garden",
        url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/62/93/a0/caption.jpg?w=500&h=-1&s=1",
        description:
            " The 58-hectare property, and home to 20,000 trees, is loaded with history, having been owned by a Japanese feudal lord (Lord Naito), then in 1906 being turned into an imperial garden, and lastly, following WW2, becoming a national garden.",
      ),
      Places(
        name: "Yomiuri Land",
        url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/6d/00/b1/caption.jpg?w=500&h=400&s=1",
        description:
            " Tokyo’s largest amusement park that offers cherry blossoms in the spring, pools in the summer, illuminations in the winter, and fun for children and adults alike year-round! Hana-Biyori at Yomiuriland Amusement Park - Unique Flowers and Digital Art",
      ),
    ],
  ),
];
