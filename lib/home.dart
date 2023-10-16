import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFav = false;
  String buttonPressed = "Button sudah ditekan";

  void toggleLove() {
    setState(() {
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 234, 0),
        title: Text(
          "Stadium",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color.fromARGB(255, 255, 249, 188),
              Color.fromARGB(255, 255, 234, 0)
            ],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Flexible(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        'images/santiago-b.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      width: 60.0, 
                      height: 60.0,
                      child: GestureDetector(
                        onTap: toggleLove,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite,
                              color: isFav ? Colors.grey : Colors.red,
                              size:
                                  25.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(4, 8, 4, 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: AspectRatio(
                          aspectRatio:
                              1.0,
                          child: Image.asset(
                            'images/spain.png',
                            fit: BoxFit
                                .cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(4, 8, 4, 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: AspectRatio(
                          aspectRatio:
                              1.0,
                          child: Image.asset(
                            'images/Real-Madrid-Logo.png',
                            fit: BoxFit
                                .cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(4, 8, 4, 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: AspectRatio(
                          aspectRatio:
                              1.0,
                          child: Image.asset(
                            'images/laliga.png',
                            fit: BoxFit
                                .cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(4, 8, 4, 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: AspectRatio(
                          aspectRatio:
                              1.0,
                          child: Image.asset(
                            'images/belingham.png',
                            fit: BoxFit
                                .cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 4,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Santiago Bernabeu Stadium",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                        child: ListView(
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                "The Santiago Bernabeu Stadium is a world-renowned football stadium located in Madrid, Spain. It is the home stadium of Real Madrid, one of the most successful and popular football clubs in the world. The stadium was inaugurated in 1947 and has undergone several renovations and expansions since then. \n\nNamed after Santiago Bernabeu, who was a former player, president, and one of the key figures in Real Madrid's history, the stadium has a seating capacity of over 81,000 spectators. It is known for its electrifying atmosphere during matches and has hosted numerous important football events, including domestic and international league matches, European Cup/Champions League finals, and FIFA World Cup matches. \n\nBesides football matches, the Santiago Bernabeu Stadium is also a popular tourist destination, attracting fans and visitors from all over the globe. The stadium offers guided tours, allowing visitors to explore the trophy room, player locker rooms, and other iconic areas, giving them a glimpse into the rich history and legacy of Real Madrid."))
                      ],
                    ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}