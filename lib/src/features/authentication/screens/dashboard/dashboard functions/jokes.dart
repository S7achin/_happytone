import 'package:flutter/material.dart';
// import 'package:quotesapp/screens/second_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Jokes extends StatefulWidget {
  const Jokes({super.key});

  @override
  State<Jokes> createState() => _Jokes();
}

class _Jokes extends State<Jokes> {
  String common_name = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Jokes😂")),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(common_name,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 0, 102, 255))),
                ),
                ElevatedButton(
                  child: const Text(" Get a Joke!! 🤣"),
                  onPressed: () async {
                    var url = Uri.parse(
                        'https://hindi-jokes-api.onrender.com/jokes?api_key=a8d5fc50f6e689a44209bec1077e');
                    var response = await http.get(url);
                    var data = jsonDecode(response.body);

                    common_name = data["jokeContent"];
                    setState(() {});
                    // print('Response status: ${response.statusCode}');
                    // print(data.runtimeType);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => SecondScreen(commonName: common_name)));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
