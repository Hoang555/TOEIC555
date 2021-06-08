import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:omed_cieo/db/DBcieot.dart';
import 'package:omed_cieo/grammar/details/details.dart';
import 'package:omed_cieo/model/grammar.dart';


class GrammarPage extends StatefulWidget {
  @override
  static String routeName = "/grammar";
  _GrammarPageState createState() => _GrammarPageState();
}

class _GrammarPageState extends State<GrammarPage> {
  DBcieot dbcieot;
  List<Grammar> listGrammar;
  String url;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    dbcieot = DBcieot();
    dbcieot.copyDB();
    listGrammar = List<Grammar>();

    dbcieot.getGrammar().then((value) {
      setState(() {
        listGrammar.clear( );
        listGrammar.addAll( value );
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
        title: Text("Grammar"),
        backgroundColor: Colors.green,
      ),



      body: ListView.builder(
          itemCount: listGrammar.length,
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
                    Text('${listGrammar[index].id}. ${listGrammar[index].title}'),
                  ],

                ),
                onTap: (){
                  url = listGrammar[index].detail;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => detailsPage(url: url),));
                  //Navigator.pushNamed(context, VocabPage.routeName, arguments: tmp);
                },
              ),
            );}
      ),
    );
  }
}
