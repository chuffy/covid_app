import 'package:covid_app/panels/world_panel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('COVID-19 Stats'),
      ),
      body: SingleChildScrollView(child: Column(
        //align content to left instead of center
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text('Worldwide Stats', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          WorldPanel()
        ]
      ))
    );
  }
}
