import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  fetchCountryData() async {
    http.Response response = await http
        .get('https://disease.sh/v3/covid-19/countries?sort=todayCases');
    setState(() {
      countryData = json.decode(response.body);
      print(countryData);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Country Stats'),
        ),
        body: countryData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                      height: 130,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 10,
                                offset: Offset(0, 10))
                          ]),
                      child: Row(children: <Widget>[
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(countryData[index]['country'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Image.network(
                                      countryData[index]['countryInfo']['flag'],
                                      height: 50,
                                      width: 60)
                                ])),
                        Expanded(
                            child: Container(

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                            Text(
                              'CONFIRMED:' +
                                  countryData[index]['cases'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              'ACTIVE:' +
                                  countryData[index]['active'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            Text(
                              'RECOVERED:' +
                                  countryData[index]['recovered'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            Text(
                                'DEATHS:' +
                                    countryData[index]['deaths'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.grey[100]
                                        : Colors.grey[900])),
                          ]),
                        ))
                      ]));
                },
                itemCount: countryData == null ? 0 : countryData.length));
  }
}
