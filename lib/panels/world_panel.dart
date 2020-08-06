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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED:',
            panelColor1: Colors.red[200],
            panelColor2: Colors.red[600],
            textColor: Colors.red,
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE:',
            panelColor1: Colors.blue[200],
            panelColor2: Colors.blue[400],
            textColor: Colors.blue[900],
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED:',
            panelColor1: Color(0xFF60BE93),
            panelColor2: Color(0xFF1B8D59),
            textColor: Colors.green,
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'TODAY:',
            panelColor1: Colors.blueGrey[200],
            panelColor2: Colors.blueGrey,
            textColor: Colors.grey[900],
            count: worldData['todayCases'].toString(),
          ),
        ]
      )
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelColor1;
  final Color panelColor2;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor1, this.panelColor2, this.textColor, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //retrieves size of device width
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      height: 80, width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [panelColor1, panelColor2]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white)),
          Text(count, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))]
      )
    );
  }
}
