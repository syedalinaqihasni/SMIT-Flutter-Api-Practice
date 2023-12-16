import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeViewTwo extends StatefulWidget {
  const HomeViewTwo({super.key});

  @override
  State<HomeViewTwo> createState() => _HomeViewTwoState();
}

class _HomeViewTwoState extends State<HomeViewTwo> {
  fetchData() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/users');
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data From Api'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: Text('${snapshot.data[index]['name']}'
                          '\nAddress: '
                          '${snapshot.data[index]['address']['street']} ,'
                          '${snapshot.data[index]['address']['suite']} ,'
                          '${snapshot.data[index]['address']['city']} ,'
                          '${snapshot.data[index]['address']['zipcode']}'),
                      subtitle: Text('Email: ${snapshot.data[index]['email']}'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              fetchData();
            });
          },
          child: const Icon(Icons.data_saver_on_outlined)),
    );
  }
}
