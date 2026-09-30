import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:practice/apimodel.dart';

class Apiprovider extends ChangeNotifier{
  final dio = Dio();

  List<ApiModelPractice> showUI = [];

  Future<void> getData() async {
    try {
      final response = await dio.get(
        "https://jsonplaceholder.typicode.com/comments",
      );

      if (response.statusCode == 200) {
        List temp = response.data;

        showUI = temp
            .map((e) => ApiModelPractice.fromJson(e))
            .toList();

        notifyListeners();
        print(response.data);
      }
    } catch (e) {
      print("Something went wrong: $e");
    }
  }

}