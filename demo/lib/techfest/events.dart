import 'package:flutter/material.dart';
import '../resources/imagestring.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,

      child: Scaffold(
        appBar: AppBar(
          title: const Text("TechFest Events"),

          bottom: const TabBar(
            tabs: [
              Tab(text: "All Events"),
              Tab(text: "Event 1"),
              Tab(text: "Event 2"),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            AllEvents(),
            Event1Details(),
            Event2Details(),
          ],
        ),
      ),
    );
  }
}


// ---------------- ALL EVENTS ----------------
class AllEvents extends StatelessWidget {
  const AllEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,

      children: [

        eventCard(
          "Coding Competition",
          "Coding Event",
          Icons.computer,
        ),

        eventCard(
          "Robo Race",
          "Robotics Event",
          Icons.smart_toy,
        ),
      ],
    );
  }

  Widget eventCard(
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Card(
      elevation: 4,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            size: 60,
            color: Colors.blue,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(subtitle),
        ],
      ),
    );
  }
}


// ---------------- EVENT 1 ----------------
class Event1Details extends StatelessWidget {
  const Event1Details({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          // Scrollable images
          SizedBox(
            height: 220,

            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                eventImage(
                  i2[0],
                ),

                eventImage(
                  i2[1],
                ),

                eventImage(
                  i2[2],
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  "Coding Competition",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  "Coding Competition is a technical event where participants solve programming problems within a given time. Participants can use languages such as C, C++, Java or Python.",
                  style: TextStyle(fontSize: 17),
                ),

                SizedBox(height: 15),

                Text(
                  "Entry Fees: ₹200",
                  style: TextStyle(fontSize: 18),
                ),

                SizedBox(height: 10),

                Text(
                  "Team Size: 1-2 participants",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget eventImage(String url) {
    return Container(
      width: 350,
      margin: const EdgeInsets.all(10),

      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}


// ---------------- EVENT 2 ----------------
class Event2Details extends StatelessWidget {
  const Event2Details({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          SizedBox(
            height: 220,

            child: ListView(
              scrollDirection: Axis.horizontal,

              children: [

                eventImage(
                  "https://picsum.photos/400/250?random=4",
                ),

                eventImage(
                  "https://picsum.photos/400/250?random=5",
                ),

                eventImage(
                  "https://picsum.photos/400/250?random=6",
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  "Robo Race",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  "Robo Race is a robotics competition where participants build and control a robot. The robot has to complete a race track in the shortest possible time.",
                  style: TextStyle(fontSize: 17),
                ),

                SizedBox(height: 15),

                Text(
                  "Entry Fees: ₹300",
                  style: TextStyle(fontSize: 18),
                ),

                SizedBox(height: 10),

                Text(
                  "Team Size: 2-4 participants",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget eventImage(String url) {
    return Container(
      width: 350,
      margin: const EdgeInsets.all(10),

      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}