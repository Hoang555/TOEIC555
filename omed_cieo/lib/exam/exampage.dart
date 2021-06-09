import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:omed_cieo/db/DBcieot.dart';
import 'package:omed_cieo/exam/body/body.dart';
import 'package:omed_cieo/model/exam.dart';
import 'package:omed_cieo/model/listexam.dart';



class ExamPage extends StatefulWidget {
  @override
  static String routeName = "/exam";
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  DBcieot dbcieot;
  String tmp;
  List<ListExam> listListExam;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    dbcieot = DBcieot();
    dbcieot.copyDB();
    listListExam = List<ListExam>();


    dbcieot.getListExam().then((value) {
      setState(() {
        listListExam.clear( );
        listListExam.addAll( value );
      });
    });

  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.home),
        ),
        title: Text("Exam"),
        backgroundColor: Colors.green,
      ),



      body: ListView.builder(
          itemCount: listListExam.length,
          itemBuilder: (context, index){
            return Container(
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green)
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Đề ${listListExam[index].idDe}: ${listListExam[index].title}'),
                  ],

                ),
                onTap: (){
                  tmp = listListExam[index].title;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Body(tmp: tmp),));
                  //Navigator.pushNamed(context, VocabPage.routeName, arguments: tmp);
                },
              ),
            );}
      ),
    );
  }
}
