import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:omed_cieo/db/DBcieot.dart';
import 'package:omed_cieo/model/topic.dart';
import 'package:omed_cieo/model/vocab.dart';
import 'package:omed_cieo/vocab/vocabpage.dart';


class TopicPage extends StatefulWidget {
  @override
  static String routeName = "/topic";
  _TopicPageState createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  DBcieot dbcieot;
  List<Topic> listTopic;
  String tmp;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    dbcieot = DBcieot();
    dbcieot.copyDB();
    listTopic = List<Topic>();

    dbcieot.getTopic().then((value) {
      setState(() {
        listTopic.clear( );
        listTopic.addAll( value );
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
        title: Text("Topic"),
        backgroundColor: Colors.green,
      ),



      body: ListView.builder(
          itemCount: listTopic.length,
          itemBuilder: (context, index){
            return GestureDetector(
              child: Material(child: ListTile(
                leading: Image.asset(listTopic[index].image, width: 65,),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${listTopic[index].title}'),
                  ],

                ),
                onTap: (){
                  tmp = listTopic[index].title;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => VocabPage(tmp: tmp),));
                  //Navigator.pushNamed(context, VocabPage.routeName, arguments: tmp);
                },
              )),
            );}
      ),
    );
  }
}
