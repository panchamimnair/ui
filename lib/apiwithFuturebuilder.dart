import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class apiwithmodelp extends StatefulWidget {
  const apiwithmodelp({super.key});

  @override
  State<apiwithmodelp> createState() => _apiwithmodelpState();
}

class _apiwithmodelpState extends State<apiwithmodelp> {

  final dio = Dio();
  Future<List<SetApio>> getdata() async {
    try {
      final response = await dio.get(
        "https://jsonplaceholder.typicode.com/posts/1/comments",
      );
      if (response.statusCode == 200) {
        List temp = response.data;
        List<SetApio> ui = temp.map((e) => SetApio.fromJson(e)).toList();
        // setState(() {});
        print(response.data);
        return ui;
      } else {
        throw Exception("the data is not geting");
      }
    } catch (e) {
      throw Exception("something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API integration")),
      body: FutureBuilder<List<SetApio>>(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 4,
                color: Colors.red,
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text("the data has error"));
          } 
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data![index].id.toString());
              },
            );
          
        },
      ),
    );
  }
}

class SetApio {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  SetApio({this.postId, this.id, this.name, this.email, this.body});

  SetApio.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = postId;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }
}
