import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:omed_cieo/db/DBcieot.dart';
import 'package:omed_cieo/model/topic.dart';
import 'package:omed_cieo/model/vocab.dart';
import 'package:omed_cieo/topic/topicpage.dart';


class VocabPage extends StatefulWidget {
  static String routeName = "/vocab";
  final String tmp;
  const VocabPage({this.tmp});

  @override
  _VocabPage createState() => _VocabPage(tmp);
}

class _VocabPage extends State<VocabPage> {

  String tmp;
  int x;
  _VocabPage(this.tmp);

  DBcieot dbcieot;
  List<Vocab> listVocab;
  List<Topic> listTopic;


  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    dbcieot = DBcieot();
    dbcieot.copyDB();
    listVocab = List<Vocab>();
    listTopic = List<Topic>();

    dbcieot.getVocab().then((value) {
      setState(() {
        listVocab.clear( );
        listVocab.addAll( value );
      });
    });
    dbcieot.getTopic().then((value) {
      setState(() {
        listTopic.clear( );
        listTopic.addAll( value );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //final arguments = ModalRoute.of(context).settings.arguments;
    for(var i = 0; i < listTopic.length; i++){
      if(listTopic[i].title == tmp){
        x = i + 1;
      }
    }
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          title: Text(tmp), //listTopic[tmp].title
          backgroundColor: Colors.green,
        ),
      body: ListView.builder(
          itemCount: listVocab.length,
          itemBuilder: (context, index){
        if(listVocab[index].idChude == x){
          return Container(
            margin: const EdgeInsets.all(0.0),
            padding: const EdgeInsets.all(1.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green)
            ),
            child: ListTile(
              leading: Text('${listVocab[index].Tu}:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${listVocab[index].Nghia}', style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
          );
        }

      })

    );
  }
}
//return Container(
//margin: const EdgeInsets.all(0.0),
//padding: const EdgeInsets.all(1.5),
//decoration: BoxDecoration(
//border: Border.all(color: Colors.green)
//),
//child: ListTile(
//leading: Text('${listVocab[index].Tu}:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//title: Row(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: [
//Text('${listVocab[index].Nghia}', style: TextStyle(fontSize: 17)),
//],
//),
//),
//);