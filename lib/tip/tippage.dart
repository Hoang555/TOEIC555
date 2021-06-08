import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:omed_cieo/db/DBcieot.dart';
import 'package:omed_cieo/tip/details/details.dart';
import 'package:omed_cieo/model/tip.dart';


class TipPage extends StatefulWidget {
  @override
  static String routeName = "/tip";
  _TipPageState createState() => _TipPageState();
}

class _TipPageState extends State<TipPage> {
  DBcieot dbcieot;
  List<Tip> listTip;
  String url;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    dbcieot = DBcieot();
    dbcieot.copyDB();
    listTip = List<Tip>();

    dbcieot.getTip().then((value) {
      setState(() {
        listTip.clear( );
        listTip.addAll( value );
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
        title: Text("Mẹo Thi"),
        backgroundColor: Colors.green,
      ),



      body: ListView.builder(
          itemCount: listTip.length,
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
                    Text(listTip[index].title),
                  ],

                ),
                onTap: (){
                  url = listTip[index].detail;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => detailsPage(url: url),));
                  //Navigator.pushNamed(context, VocabPage.routeName, arguments: tmp);
                },
              ),);
            }
      ),
    );
  }
}
