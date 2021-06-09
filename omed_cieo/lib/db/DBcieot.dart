import 'dart:io';
import 'dart:typed_data';
import 'dart:core';

import 'package:flutter/services.dart';
import 'package:omed_cieo/model/exam.dart';
import 'package:omed_cieo/model/grammar.dart';
import 'package:omed_cieo/model/listexam.dart';
import 'package:omed_cieo/model/tip.dart';
import 'package:omed_cieo/model/topic.dart';
import 'package:omed_cieo/model/vocab.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBcieot{

  copyDB() async{
    // Construct a file path to copy database to
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "DBcieot.db");

// Only copy if the database doesn't exist
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
      // Load database from asset and copy
      ByteData data = await rootBundle.load(join('assets', 'DBcieot.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save copied asset to documents
      await new File(path).writeAsBytes(bytes);
    }
  }
  openDB() async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'DBcieot.db');
    return await openDatabase(databasePath);

  }
/// TOPIC - TOPIC - TOPIC ///

  Future<List<Topic>> getTopic() async{
    List<Topic> data = new List<Topic>();
    Database db = await openDB();
    var list = await db.rawQuery('SELECT * FROM Topic');
    //var list = await db.query('Topic');
    for(var item in list.toList()){
      data.add(Topic(idChude: item['id'], title: item['title'], image: item['image']));
    }
    db.close();
    return data;
  }
  countTopic() async{
    Database db = await openDB();
    var count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM Topic'));
    return count;
  }
  /// VOCAB - VOCAB - VOCAB ///

  Future<List<Vocab>> getVocab() async{
    List<Vocab> data = new List<Vocab>();
    Database db = await openDB();
    var list = await db.rawQuery('SELECT * FROM Vocab');
    //var list = await db.query('Topic');
    for(var item in list.toList()){
      data.add(Vocab(id: item['id'], idChude: item['idChude'], Tu: item['Tu'], Nghia: item['Nghia']));
    }
    db.close();
    return data;
  }
  countVocab() async{
    Database db = await openDB();
    var count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM Vocab'));
    return count;
  }
  /// GRAMMAR - GRAMMAR - GRAMMAR ///

  Future<List<Grammar>> getGrammar() async{
    List<Grammar> data = new List<Grammar>();
    Database db = await openDB();
    var list = await db.rawQuery('SELECT * FROM Grammar');
    //var list = await db.query('Topic');
    for(var item in list.toList()){
      data.add(Grammar(id: item['id'], title: item['title'], detail: item['detail']));
    }
    db.close();
    return data;
  }
  countGrammar() async{
    Database db = await openDB();
    var count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM Grammar'));
    return count;
  }
  /// TIP - TIP - TIP ///

  Future<List<Tip>> getTip() async{
    List<Tip> data = new List<Tip>();
    Database db = await openDB();
    var list = await db.rawQuery('SELECT * FROM Tip');
    //var list = await db.query('Topic');
    for(var item in list.toList()){
      data.add(Tip(id: item['id'], title: item['title'], detail: item['detail']));
    }
    db.close();
    return data;
  }
  countTip() async{
    Database db = await openDB();
    var count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM Tip'));
    return count;
  }

  /// EXAM - EXAM - EXAM ///

  Future<List<Exam>> getExam() async{
    List<Exam> data = new List<Exam>();
    Database db = await openDB();
    var list = await db.rawQuery('SELECT * FROM Exam');
    //var list = await db.query('Topic');
    for(var item in list.toList()){
      data.add(Exam(id: item['id'], idDe: item['idDe'], question: item['question'], a: item['a'], b: item['b'], c: item['c'], d: item['d'], correct: item['correct']));
    }
    db.close();
    return data;
  }
  countExam() async{
    Database db = await openDB();
    var count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM Exam'));
    return count;
  }
  /// LISTEXAM - LISTEXAM - LISTEXAM ///

  Future<List<ListExam>> getListExam() async{
    List<ListExam> data = new List<ListExam>();
    Database db = await openDB();
    var list = await db.rawQuery('SELECT * FROM ListExam');
    //var list = await db.query('Topic');
    for(var item in list.toList()){
      data.add(ListExam(idDe: item['idDe'], title: item['title']));
    }
    db.close();
    return data;
  }
  countListExam() async{
    Database db = await openDB();
    var count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM ListExam'));
    return count;
  }
}



