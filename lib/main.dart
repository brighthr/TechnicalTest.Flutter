import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'list/',
      routes: {
        "list/": (context) => ListPage(),
        "details/": (context) => DetailsPage(),
      },
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  dynamic post;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return FutureBuilder<dynamic>(
        future: http.get(Uri.parse(
            'https://jsonplaceholder.typicode.com/posts/${args?['id']}')),
        builder: (post, response) {
          if (response.hasData) {
            dynamic data = json.decode(response.data!.body);
            return Scaffold(
              appBar: AppBar(
                title: const Text('Post details'),
              ),
              body: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(children: [
                    Text(
                      data['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Container(height: 10),
                    Text(data['body'], style:  const TextStyle(fontSize: 16))
                  ])),
            );
          } else {
            return Container();
          }
        });
  }
}

class _ListPageState extends State<ListPage> {
  List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();
    http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'))
        .then((response) {

      setState(() {
        posts = json.decode(response.body);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("List of posts"),
      ),
      body: ListView(
        children: posts.map((post) {
          return InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('details/', arguments: {'id': post['id']});
            },
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(post['body']),
                  Container(height: 10),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
