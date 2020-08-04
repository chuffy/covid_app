import 'dart:convert';

import 'package:covid_app/panels/world_panel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Widget globe_svg = SvgPicture.asset(
      'assets/globe.svg',
      height: 200,
      semanticsLabel: 'Globe');

  final Widget country_svg = SvgPicture.asset(
      'assets/country.svg',
      height: 200,
      semanticsLabel: 'Country');

  Map worldData;
  fetchWorldWideData() async{
    http.Response response = await http.get('https://disease.sh/v3/covid-19/all');
    setState(() {
      worldData = json.decode(response.body);
      print(worldData);
      });
    }


    @override
  void initState() {
    fetchWorldWideData();
    super.initState();
  }

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
            child: Text('WORLDWIDE', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ),
          Center(child: globe_svg),
          //show progress indicator if data hasn't loaded yet
          worldData==null?CircularProgressIndicator():WorldPanel(worldData: worldData),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text('COUNTRY', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),

          ),
          Center(child: country_svg)
        ]
      ))
    );
  }
}
