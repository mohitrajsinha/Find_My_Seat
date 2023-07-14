import 'package:flutter/material.dart';
import 'package:seatmap2/pages/menu.dart';
import 'package:seatmap2/pages/second_ac.dart';
import 'package:seatmap2/pages/sleeper.dart';
import 'package:seatmap2/pages/third_ac.dart';
import 'package:seatmap2/utils/routes.dart';
import 'package:seatmap2/pages/welcome_page.dart';

void main() => runApp(const SeatFinderApp());

class SeatFinderApp extends StatelessWidget {
  const SeatFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
     final Brightness brightness = MediaQuery.of(context).platformBrightness;
    return MaterialApp(
      theme: brightness == Brightness.dark
        ? ThemeData.dark()
        : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: 'Seat Finder',
      routes: {
        "/": (context) => const WelcomePage(),
        MyRoutes.menuroute: (context) => const Menu(),
        MyRoutes.secondacroute: (context) => const SecondACPage(),
        MyRoutes.thirdacroute: (context) => const ThirdACPage(),
        MyRoutes.sleeperroute: (context) => const SleeperPage()
      },
    );
  }
}
