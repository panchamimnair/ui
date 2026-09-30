import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:practice/apimodel.dart';

class ApiWithModel extends StatefulWidget {
  const ApiWithModel({super.key});

  @override
  State<ApiWithModel> createState() => _ApiWithModelState();
}

class _ApiWithModelState extends State<ApiWithModel> {
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

        setState(() {});
        print(response.data);
      }
    } catch (e) {
      print("Something went wrong: $e");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
      ),

      body: Column(
        children: [

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              getData();
            },
            child: const Text("Get Data"),
          ),

           SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: showUI.length,

              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        showUI[index].name ?? "",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        showUI[index].email ?? "",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        showUI[index].body ?? "",
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),

                       Divider(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Model class

