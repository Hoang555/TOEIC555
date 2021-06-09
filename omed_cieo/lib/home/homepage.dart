import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:omed_cieo/exam/exampage.dart';
import 'package:omed_cieo/grammar/grammarpage.dart';
import 'package:omed_cieo/model/selection.dart';
import 'package:omed_cieo/tip/tippage.dart';
import 'package:omed_cieo/topic/topicpage.dart';



class HomePage extends StatelessWidget {
  static String routeName = "/home";
  List<Selection> selection = Selection.init();
  int id;
//  HomePage(this.id);
  List<Selection> getFromCate(int id) {
    List<Selection> tmp = [];
    for (int i = 0; i < selection.length; i++) {
      tmp.add(selection[i]);
    }
    return tmp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"), centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: getFromCate(id).length,
        itemBuilder: (context, index){
          return GestureDetector(
            child: Material(child: ListTile(
              leading: Image.asset(getFromCate(id)[index].image, width: 70,),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(selection[index].title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text(selection[index].description)
                ],
              ),
              onTap: (){
                if(selection[index].id==1){
                  Navigator.pushNamed(context, TopicPage.routeName);
                }
                if(selection[index].id==2){
                  Navigator.pushNamed(context, GrammarPage.routeName);
                }
                if(selection[index].id==3){
                  Navigator.pushNamed(context, ExamPage.routeName);
                }
                if(selection[index].id==4){
                  Navigator.pushNamed(context, TipPage.routeName);
                }
              },
            )),
          );}
          ),
    );
  }
}
