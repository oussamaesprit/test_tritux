import 'dart:convert';

import 'package:flutter_tritux/domain/list.dart';



class ListRepository {
  Future<List<Listt>> fetchList() async {
    // Simulate loading data from a JSON file
    String jsonFileData = await Future.delayed(Duration(seconds: 2), () {
      return '''
        [{"id":52843822,"msisdn":"50011623","operationCode":"BATCH_LOAD_PINS","operationLaunchDate":"2023-07-13T10:27:42.978","totalPinsBeforeOp":1295,"totalPinsAfterOp":1301,"operationResponse":"Done with success","executor":"admin"},
        {"id":52512690,"msisdn":"50011623","operationCode":"BATCH_LOAD_PINS","operationLaunchDate":"2023-07-10T10:17:53.672","totalPinsBeforeOp":1281,"totalPinsAfterOp":1283,"operationResponse":"Done with success","executor":"admin"},
        {"id":52664419,"msisdn":"50011623","operationCode":"BATCH_LOAD_PINS","operationLaunchDate":"2023-07-11T10:36:07.184","totalPinsBeforeOp":1283,"totalPinsAfterOp":1289,"operationResponse":"Done with success","executor":"admin"},
        {"id":52732907,"msisdn":"50011623","operationCode":"BATCH_LOAD_PINS","operationLaunchDate":"2023-07-12T10:32:45.185","totalPinsBeforeOp":1289,"totalPinsAfterOp":1295,"operationResponse":"Done with success","executor":"admin"},
        {"id":52885210,"msisdn":"50011623","operationCode":"TRANSFER_PINS","operationLaunchDate":"2023-07-13T22:05:32.079","totalPinsBeforeOp":1301,"totalPinsAfterOp":1251,"operationResponse":"Done with success : out","executor":"myopins"}]
      ''';
    });


    List<dynamic> jsonMovies = jsonDecode(jsonFileData);
    List<Listt> list = jsonMovies.map((jsonMovie) => Listt(
      id: jsonMovie['id'].toString(),
      title: jsonMovie['msisdn'].toString(),
      director: jsonMovie['operationCode'].toString(),
      year: jsonMovie['operationLaunchDate'].toString(),
    )).toList();

    return list;
  }
}