import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: ElevatedButton(
              child: Text('Hola'),
              onPressed: () async {
                // This example uses the Google Books API to search for books about http.
                // https://developers.google.com/books/docs/overview
                var url = Uri.https(
                    'www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

                // Await the http get response, then decode the json-formatted response.
                var response = await http.get(url);
                if (response.statusCode == 200) {
                  var jsonResponse =
                      convert.jsonDecode(response.body) as Map<String, dynamic>;
                  var itemCount = jsonResponse['totalItems'];
                  print('Number of books about http: $itemCount.');
                } else {
                  print('Request failed with status: ${response.statusCode}.');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
