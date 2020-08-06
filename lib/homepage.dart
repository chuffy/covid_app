import 'dart:convert';

import 'package:covid_app/country_page.dart';
import 'package:covid_app/panels/country_panel.dart';
import 'package:covid_app/panels/world_panel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

import 'datasource.dart';

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

  List countryData;
  fetchCountryData() async{
    http.Response response = await http.get('https://disease.sh/v3/covid-19/countries?sort=todayCases');
    setState(() {
      countryData = json.decode(response.body);
      print(countryData);
    });
  }


    @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
              Text('Worldwide', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
              //country button
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                },
                child: Container(decoration: BoxDecoration(
                            color: primaryBlack,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text('Country', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),)),
              ),
                ],
             ),
          ),
          Center(child: globe_svg),
          //show progress indicator if data hasn't loaded yet
          worldData==null?CircularProgressIndicator():WorldPanel(worldData: worldData),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text('Today', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),

          ),
          Center(child: country_svg ),
          SizedBox(height: 10,),
          countryData == null ? Container(): MostAffectedPanel(countryData: countryData,)
        ]
      ))
    );
  }
}
