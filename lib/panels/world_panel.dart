import 'package:flutter/material.dart';

class WorldPanel extends StatelessWidget {
  final Map worldData;
  const WorldPanel({Key key, this.worldData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        //prevent scrolling
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 4),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED:',
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE:',
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED:',
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'CONFIRMED:',
            panelColor: Colors.grey[400],
            textColor: Colors.grey[900],
            count: worldData['todayCases'].toString(),
          ),
        ]
      )
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  //constructor
  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //retrieves size of device width
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      height: 80, width: width,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: textColor)),
          Text(count, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor))]
      )
    );
  }
}
