
import 'package:flutter/material.dart';
import 'package:seatmap2/pages/second_ac.dart';
import 'package:seatmap2/pages/sleeper.dart';
import 'package:seatmap2/pages/third_ac.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Your Coach"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(child: Padding(padding: EdgeInsets.all(20))),
          OutlinedButton.icon(
            icon: const Icon(Icons.train),
            label: const Text("AC 2-tier (2A)"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SecondACPage()));
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(25),
              textStyle: const TextStyle(fontSize: 30),
              // padding: EdgeInsets.all(50),
              side: const BorderSide(width: 2.0, color: Colors.blue),
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          OutlinedButton.icon(
            label: const Text("AC 3-tier (3A)"),
            icon: const Icon(Icons.train),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ThirdACPage()));
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(25),
              textStyle: const TextStyle(fontSize: 30),
              // padding: EdgeInsets.all(50),
              side: const BorderSide(width: 2.0, color: Colors.blue),
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          OutlinedButton.icon(
            label: const Text("Sleeper Class"),
            icon: const Icon(Icons.train),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SleeperPage()));
            },
            style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.all(50),
              side: const BorderSide(width: 2.0, color: Colors.blue),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(25),
              textStyle: const TextStyle(fontSize: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
