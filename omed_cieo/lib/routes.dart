import 'package:flutter/widgets.dart';
import 'package:omed_cieo/exam/exampage.dart';
import 'package:omed_cieo/grammar/grammarpage.dart';
import 'package:omed_cieo/home/homepage.dart';
import 'package:omed_cieo/splashpage.dart';
import 'package:omed_cieo/tip/tippage.dart';
import 'package:omed_cieo/topic/topicpage.dart';
import 'package:omed_cieo/vocab/vocabpage.dart';


final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  HomePage.routeName: (context) => HomePage(),
  TopicPage.routeName: (context) => TopicPage(),
  ExamPage.routeName: (context) => ExamPage(),
  VocabPage.routeName: (context) => VocabPage(),
  GrammarPage.routeName: (context) => GrammarPage(),
  TipPage.routeName: (context) => TipPage(),
};
