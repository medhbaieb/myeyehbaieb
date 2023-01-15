import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'About Us',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255)), //<-- SEE HERE
            ),
          ],
        ),
      ),

      /**we use the align widget to align the menu icon */
      body: Column(
        children: [
          SizedBox(
            width: 40,
            height: 100,
          ),
          Container(
            height: 440,
            width: 300,
            padding: EdgeInsets.all(18),
            child: Stack(
              children: [
                Image.asset(
                  'assets/high.png',
                  height: 350,
                  width: 350,
                  scale: 2,
                  alignment: Alignment.topCenter,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "This application aims to help blind people accomplish some daily tasks. ",
                      style: TextStyle(fontSize: 16, fontFamily: 'Comfortaa'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.justify,
                    ),
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
