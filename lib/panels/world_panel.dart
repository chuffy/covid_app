import 'package:flutter/material.dart';

class WorldPanel extends StatelessWidget {
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
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: '1222',
          ),
          StatusPanel(
            title: 'ACTIVE:',
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count: '888',
          ),
          StatusPanel(
            title: 'RECOVERED:',
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: '1222',
          ),
          StatusPanel(
            title: 'CONFIRMED:',
            panelColor: Colors.grey[400],
            textColor: Colors.grey[900],
            count: '1222',
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
      height: 80, width: width/2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),Text(count, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor))]
      )
    );
  }
}
