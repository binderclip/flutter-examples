import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AsyncListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class _AsyncListViewState extends State<AsyncListView> {
  bool _isButtonClicked = false;
  var _buttonIcon = Icons.cloud_download;
  var _buttonText = "Fetch Data";
  var _buttonColor = Colors.green;
  final title = 'AsyncListView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: FutureBuilder<Demo>(
          ///If future is null then API will not be called as soon as the screen
          ///loads. This can be used to make this Future Builder dependent
          ///on a button click.
          future: _isButtonClicked ? getDemoResponse() : null,
          builder:
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: _buttonColor,
        onPressed: () {
          ///Calling method to fetch data from the server
          getDemoResponse();

          ///You need to reset UI by calling setState.
          setState(() {
            _isButtonClicked == false
                ? _isButtonClicked = true
                : _isButtonClicked = false;

            if (!_isButtonClicked) {
              _buttonIcon = Icons.cloud_download;
              _buttonColor = Colors.green;
              _buttonText = "Fetch Data";
            } else {
              _buttonIcon = Icons.replay;
              _buttonColor = Colors.deepOrange;
              _buttonText = "Reset";
            }
          });
        },
        icon: Icon(
          _buttonIcon,
          color: Colors.white,
        ),
        label: Text(
          _buttonText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


String url = 'https://jsonplaceholder.typicode.com/posts';
///Method for GET Request
Future<Demo> getDemoResponse() async{
  final response = await http.get('$url/1');
  return responseFromJson(response.body);
}

///Use this https://app.quicktype.io/ converter tool to create your ///data class according to the JSON response.
///API used here is - https://jsonplaceholder.typicode.com/posts/1

///Used to map JSON data fetched from the server
Demo responseFromJson(String jsonString) {
  final jsonData = json.decode(jsonString);
  return Demo.fromJson(jsonData);
}
///Model Class
///Make sure the keys here are same as that in
///the response
class Demo {
  int userId;
  int id;
  String title;
  String body;

  Demo({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  ///This method is to deserialize your JSON
  ///Basically converting a string response to an object model
  ///Here key is always a String type and value can be of any type
  ///so we create a map of String and dynamic.
  factory Demo.fromJson(Map<String, dynamic> json) => new Demo(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );
}