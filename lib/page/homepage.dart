import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{


  bool _visiable = true;
  var _dateTime;

  timeset(var time, int sethour, int setminute){
    String tmp;
    int tmphour = time.hour;
    int tmpminute = time.minute;

    if(tmpminute > 30){
      tmphour -= sethour;
      tmpminute -= setminute;
    }else{
      tmphour -= sethour;
      tmpminute += setminute;
    }

    if(tmphour<0){
      tmphour = 24 + tmphour;
    }
    tmp = '${tmphour} 시 ${tmpminute}분';
    return tmp;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_visiable == true)?Container(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.black
                ),
                height:MediaQuery.of(context).size.height,
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height/5,),
                  Text(
                    'Wake up time',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).textScaleFactor*30,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 100,),
                  Container(
                    child: timepicer(),
                  ),
                  SizedBox(height: 100,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        _visiable = !_visiable;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.height/15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 0.4),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          'Set Time',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).textScaleFactor*40,
                            color: Colors.black,
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
        ),
      ):Container(
        child:Stack(
          children: <Widget>[
            Container(
              height:MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.black
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height/6,),
                  Text(
                    'Sleep Time',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).textScaleFactor*30,
                      color: Colors.white
                    ),
                  ),
                  times(9, 0),
                  times(7, 30),
                  times(6, 0),
                  times(4, 30),
                  SizedBox(height: MediaQuery.of(context).size.height/8,),
                  Container(
                    child: Container(
                      child: InkWell(
                        onTap: (){
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
                                colors: [Colors.white, Colors.white]
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Reset',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).textScaleFactor*40,
                                  color: Colors.black,
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

  Widget times(int sethour, int setminute){
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Text(
        timeset(_dateTime,sethour,setminute).toString(),
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: MediaQuery.of(context).textScaleFactor*30,
            color: Colors.white
        ),
      ),
    );
  }
}
