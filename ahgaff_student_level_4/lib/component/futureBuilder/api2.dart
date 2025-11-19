import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api2 extends StatefulWidget {
  const Api2({super.key});

  @override
  State<Api2> createState() => _Api2State();
}

class _Api2State extends State<Api2> {
  Future<List<RandomUser>> futureRandomUser() async {
    List<RandomUser> randomUserList = [];
    const url = 'https://randomuser.me/api/';
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    var results = data['results'];
    for (var randomUser in results) {
      randomUserList.add(
        RandomUser(
          name: randomUser['name']['first'] + " " + randomUser['name']['last'],
          gender: randomUser['gender'],
          email: randomUser['email'],
          image: randomUser['picture']['large'],
        ),
      );
    }
    return randomUserList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("flutter with api")),
      body: FutureBuilder(
        future: futureRandomUser(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Card(
                color: Colors.teal,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          '${snapshot.data?[0].image}',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Name:${snapshot.data?[0].name}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Gender: ${snapshot.data?[0].gender}',
                        // ${snapshot.data?[0].gender}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Email:${snapshot.data?[0].email}',
                        //  ${snapshot.data?[0].email},
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class RandomUser {
  String? name;
  String? gender;
  String? email;
  String? image;

  RandomUser({this.name, this.gender, this.email, this.image});
}
