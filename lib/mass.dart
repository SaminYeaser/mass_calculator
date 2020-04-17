import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mass extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MassConvertor();
  }

}

class MassConvertor extends State<Mass> {

  TextEditingController _weight = new TextEditingController();
  int radioValue = 0;
  double _finalValue = 0.0;

  void handleRadioValueChange(int value){
      setState(() {
        radioValue = value;
        switch(radioValue){
          case 0:
            _finalValue = calculateweight(_weight.text,10.44);
            break;
          case 1:
            _finalValue = calculateweight(_weight.text,3.711);
            break;
          case 2:
            _finalValue = calculateweight(_weight.text,1.62);
        }
      });
  }
  double calculateweight(String weight, double d){
    if(weight.toString().isNotEmpty && int.parse(weight)>0){
      double deciValaue = int.parse(weight)/9.81;
      return deciValaue * d;
    }else{
      return null;
    }

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mass Cal.",
        style: new TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
        ),
        ),
        backgroundColor: Colors.black38,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            new Image.asset('images/planet.png',
            height: 120,),
            new Container(
              margin: EdgeInsets.all(3.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Your weight on Earth",
                      hintText: "kg",
                      icon: new Icon(Icons.person_outline)
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(activeColor: Colors.red,value: 0, groupValue: radioValue, onChanged: handleRadioValueChange),
                      new Text("Saturn",style: new TextStyle(color: Theme.of(context).backgroundColor),),
                      new Radio(activeColor: Colors.orange,value: 1, groupValue: radioValue, onChanged: handleRadioValueChange),
                      new Text("Mars",style: new TextStyle(color: Theme.of(context).backgroundColor),),
                      new Radio(activeColor: Colors.white30,value: 2, groupValue: radioValue, onChanged: handleRadioValueChange),
                      new Text("Moon",style: new TextStyle(color: Theme.of(context).backgroundColor),)
                    ],
                  ),
                  //result feild
                  new Padding(padding: new EdgeInsets.all(20)),
                  new Text("$_finalValue kg",
                  style: new TextStyle(
                    color: Colors.black54,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}