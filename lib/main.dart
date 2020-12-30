import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:pokemon/pokeapi.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
    },
  ));
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Pokehub pokehub;

  var url = " https://pokeapi.co/api/v2/egg-group/ditto/";

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  fetchdata() async {
    var response = await http
        .get(Uri.encodeFull('https://pokeapi.co/api/v2/egg-group/ditto/'));
    // var response = await http.get(url);
    print(response.body);
    var decjson = jsonDecode(response.body);

    pokehub = Pokehub.fromJson(decjson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon"),
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10.0,
        child: FutureBuilder(
          future: fetchdata(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // if (snapshot.data == null) {
            //   return Container(
            //     child: Center(
            //       child: Text('Loading...'),
            //     ),
            //   );
            // } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("${pokehub.name}"),
                      trailing: Text("${pokehub.id}"),
                    )
                  ],
                );
              },
            );
            // }
          },
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
        child: Icon(
          Icons.add,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
