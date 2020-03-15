import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    color: Colors.blue,
    home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count = 0;
  String _status = "Pode Entrar!";
  void changeCount(int delta) {
    setState(() {
      _count+= delta;
      if(_count < 0) {
       _status = "Faliu!";
      } else if(_count > 11){
        _status = "Lotado!";
      } else {
        _status = "Pode Entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_count",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, backgroundColor: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1",
                        style: TextStyle(color: Colors.white, fontSize: 40, backgroundColor: Colors.black)),
                    onPressed: () {changeCount(1);},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1",
                        style: TextStyle(color: Colors.white, fontSize: 40, backgroundColor: Colors.black)),
                    onPressed: (){changeCount(-1);}
                  ),
                )
              ],
            ),
            Text(
              _status,
              style: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}

