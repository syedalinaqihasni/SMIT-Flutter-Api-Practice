import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeViewOne extends StatefulWidget {
  const HomeViewOne({super.key});

  @override
  State<HomeViewOne> createState() => _HomeViewOneState();
}

class _HomeViewOneState extends State<HomeViewOne> {
  fetchData() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetching the data'),
      ),
      body: FutureBuilder(
          future: fetchData(),
          builder: ((context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, int index) {
                    final id = snapshot.data[index]['id'];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('$id'),
                        ),
                        title: Text('${snapshot.data[index]['title']}'),
                        subtitle: Text('${snapshot.data[index]['body']}'),
                      ),
                    );
                  });
            }
            return const Center(child: CircularProgressIndicator());
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
        },
        child: const Icon(Icons.abc),
      ),
    );
  }
}
