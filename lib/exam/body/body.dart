import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:omed_cieo/db/DBcieot.dart';
import 'package:omed_cieo/home/homepage.dart';
import 'package:omed_cieo/model/exam.dart';
import 'package:omed_cieo/model/listexam.dart';

var finalScore = 0;
var questionNumber = 1;

class Body extends StatefulWidget {
  final String tmp;
  const Body({this.tmp});

  @override
  _BodyState createState() => _BodyState(tmp);
}

class _BodyState extends State<Body> {
  DBcieot dbcieot;
  String tmp;
  _BodyState(this.tmp);
  int counter = 30;
  Timer _timer;

  List<Exam> listExam;
  List<ListExam> listListExam;

  //var quiz = new AnimalQuiz();

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    dbcieot = DBcieot();
    dbcieot.copyDB();
    listExam = List<Exam>();
    resetQuiz();


    dbcieot.getExam().then((value) {
      setState(() {
        listExam.clear( );
        listExam.addAll( value );
      });
    });

  }

  void _startTimer() {
    counter = 30;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }



  @override

  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios),
            ),
            title: Text(tmp),
            actions: <Widget>[
              (counter > 0)
                  ? Text("")
                  : Text( "TIME!", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
              ),
              Text(
                '$counter', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ), ),
            ],
            backgroundColor: Colors.green,
          ),

          body: Container(
                    margin: const EdgeInsets.all(10.0),
                    alignment: Alignment.topCenter,
                    child: new Column(
                        children: <Widget>[
                          new Padding(padding: EdgeInsets.all(20.0)),
                          new Container(
                            alignment: Alignment.centerRight,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Text("Question ${listExam[questionNumber - 1].id}",
                                  style: new TextStyle(
                                      fontSize: 22.0, fontWeight: FontWeight.bold
                                  ),),

                                new Text("Score: $finalScore",
                                  style: new TextStyle(
                                      fontSize: 22.0, fontWeight: FontWeight.bold
                        ),)
                    ],
                  ),
                ),

                //image
                          new Padding(padding: EdgeInsets.all(10.0)),
                          new Padding(padding: EdgeInsets.all(10.0)),
                          new Text(listExam[questionNumber - 1].question,
                            style: new TextStyle(
                              fontSize: 20.0,
                            ),),

                          new Padding(padding: EdgeInsets.all(10.0)),

                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              //btn1

                              new MaterialButton(
                                minWidth: 120.0,
                                color: Colors.green,
                                child: new Text('A. ${listExam[questionNumber - 1].a}'),

                                onPressed: (){
                                  if(listExam[questionNumber - 1].correct == 1){
                                    debugPrint("Correct");
                                    finalScore++;
                                  }else{
                                    debugPrint("Wrong");
                                  }
                                  updateQuestion();
                                  },
                              ),
                              //btn2
                              new MaterialButton(
                                minWidth: 120.0,
                                color: Colors.green,
                                child: new Text('B. ${listExam[questionNumber - 1].b}'),
                                onPressed: (){
                                  if(listExam[questionNumber - 1].correct == 2){
                                    debugPrint("Correct");
                                    finalScore++;
                                  }else{
                                    debugPrint("Wrong");
                                  }
                                  updateQuestion();
                                  },
                              ),
                            ],),
                          new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                //btn3
                                new MaterialButton(
                                  minWidth: 120.0,
                                  color: Colors.green,
                                  child: new Text('C. ${listExam[questionNumber - 1].c}'),

                                  onPressed: (){
                                    if(listExam[questionNumber - 1].correct == 3){
                                      debugPrint("Correct");
                                      finalScore++;
                                    }else{
                                      debugPrint("Wrong");
                                    }
                                    updateQuestion();
                                    },
                                ),
                                //btn4
                                new MaterialButton(
                                  minWidth: 120.0,
                                  color: Colors.green,
                                  child: new Text('D. ${listExam[questionNumber - 1].d}'),

                                  onPressed: (){
                                    if(listExam[questionNumber - 1].correct == 4){
                                      debugPrint("Correct");
                                      finalScore++;
                                    }else{
                                      debugPrint("Wrong");
                                    }
                                    updateQuestion();
                                    },
                                ),
                              ]
                          )
                        ]
                    )
                )

              ),

        );
  }

  void resetQuiz(){
    setState(() {
      finalScore = 0;
      questionNumber = 1;
      _startTimer();
    });
  }


  void updateQuestion(){
    setState(() {
      if(questionNumber == listExam.length || counter == 0){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
  }
}



class Summary extends StatelessWidget{
  final int score;
  String NhanXet;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(finalScore > 8){
      NhanXet = "Excelent";
    }
    else{
      if(finalScore > 5){
        NhanXet = "Good";
      }
      else{
        NhanXet = "So Bad :(";
      }
    }

    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        body: new Container(alignment: Alignment.center, color: Colors.green,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              new Text("Final Score: $finalScore",
                style: new TextStyle(
                    fontSize: 35.0, color: Colors.white
                ), ),

              new Padding(padding: EdgeInsets.all(10.0)),

              new Text( NhanXet,
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white
                ),),


              new Padding(padding: EdgeInsets.all(10.0)),

              new MaterialButton(
                color: Colors.white,
                onPressed: (){
                  questionNumber = 1;
                  finalScore = 0;
                  Navigator.pushNamed(context, HomePage.routeName);
                },
                child: new Text("Back to Home",
                  style: new TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green
                  ),),)

            ],
          ),
        ),


      ),
    );
  }


}
