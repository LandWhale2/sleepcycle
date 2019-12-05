import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _dateTime;
  bool _visiable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_visiable == true)?Container(
        child: Stack(
          children: <Widget>[
            Container(
              height:MediaQuery.of(context).size.height,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/night.jpg',),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height/5,),
                Container(
                  child: timepicer(),
                ),
                SizedBox(height: 100,),
                InkWell(
                  onTap: (){
                    print(_dateTime);
                    setState(() {
                      _visiable = !_visiable;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: MediaQuery.of(context).size.height/15,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      border: Border.all(width: 0.4),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        colors: [Colors.lightBlueAccent, Colors.lightGreen]
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Set Time',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).textScaleFactor*40,
                          color: Colors.white54,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ):Container(
        child:Stack(
          children: <Widget>[
            Container(
              height:MediaQuery.of(context).size.height,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('assets/night.jpg',),
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height/6,),
                  Container(
                    child: AnimatedOpacity(
                      opacity: _visiable? 2.0 : 1.0,
                      duration: Duration(milliseconds: 500),
                      child: InkWell(
                        onTap: (){
                          print(_dateTime);
                          setState(() {
                            _visiable = !_visiable;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: MediaQuery.of(context).size.height/15,
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            border: Border.all(width: 0.4),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                                colors: [Colors.lightBlueAccent, Colors.lightGreen]
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Set Time',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).textScaleFactor*40,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timepicer() {
    return new TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.white
      ),
      highlightedTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.lightBlueAccent
      ),
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: true,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}
