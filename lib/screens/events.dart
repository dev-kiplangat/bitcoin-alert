import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  static var counter = 0;

  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/vectors/bg.jpg"),
            fit: BoxFit.fill,
          ),
          backgroundBlendMode: BlendMode.colorDodge,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
              tooltip: "Toggle Menu",
              color: Colors.black,
            ),
            title: Text(
              "Activities",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.2),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 160,
                        alignment: Alignment.center,
                        child: Text(
                          "Events",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        width: 160,
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Tickets",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(.7),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  " May 2021",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                EventCard(),
                SizedBox(
                  height: 25,
                ),
                Text(
                  " May 2021",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                EventCard(),
                SizedBox(
                  height: 20,
                ),
                EventCard(),
                Text(
                  "This is the counter, $counter",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: Text("Increament"),
                ),
              ],
            ),
            // second part
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            color: Colors.black.withOpacity(.1),
            blurRadius: 10,
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1),
            ),
            child: null,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 80,
            width: 2,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1),
            ),
            child: null,
          ),
          SizedBox(
            width: 25,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "12th Family Quiz Night\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.9),
                    fontSize: 17,
                  ),
                ),
                TextSpan(
                  text: "Venue: Home, Nairobi\n",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: "2 Tickets Ksh 400 paid\n",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: "Date: 30th May\n",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
