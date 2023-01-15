import 'package:flutter/material.dart';
import 'chatvoice.dart';


import 'dart:convert';
class notification extends StatelessWidget {
  const notification({super.key});

  static const String _title = 'Notifications';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title), centerTitle: true),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final ScrollController _firstController = ScrollController();
  var list = ['one', 'two', 'three'];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: <Widget>[
          SizedBox(
              width: constraints.maxWidth,
           
              child: Scrollbar(
                thumbVisibility: true,
                controller: _firstController,
                child: ListView.builder(
                    controller: _firstController,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Column(children: [
                          Card(
                              color: Color.fromARGB(255, 123, 123, 248)
                                  .withAlpha(30),
                              margin: EdgeInsets.only(top: 30.0),
                              child: Column(
                                children:<Widget> [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 10.0, bottom: 0.0),
                                  ),
                                  Container(
                                    child: const SizedBox(
                                      width: 330,
                                      height: 40,
                                      child: Text(
                                        'james need your help  ',
                                        style: TextStyle(fontSize: 25),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  MaterialButton(
                                   onPressed: () {
                                      debugPrint('Card tapped.');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  chatvoice()));
                                    },
                                    child: Image.asset(
                                      'assets/camera-icon-21.png',
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              )),
                          Card(
                              color: Color.fromARGB(255, 123, 123, 248)
                                  .withAlpha(30),
                              margin: EdgeInsets.only(top: 30.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 10.0, bottom: 0.0),
                                  ),
                                  Container(
                                    child: const SizedBox(
                                      width: 330,
                                      height: 40,
                                      child: Text(
                                        'Hbaieb need your help  ',
                                        style: TextStyle(fontSize: 25),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  MaterialButton(
                                   onPressed: () {
                                      debugPrint('Card tapped.');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  chatvoice()));
                                    },
                                    child: Image.asset(
                                      'assets/camera-icon-21.png',
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              )),
                        ]),
                      );
                    }),
              )),
        ],
      );
    });
  }
}
