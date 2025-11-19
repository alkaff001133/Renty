import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  const Containers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Containers',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 200,
                width: 130,
                color: Colors.black,
                alignment: Alignment.center,
                child: Text(
                  'item 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 130,
                color: const Color.fromARGB(255, 207, 205, 205),
                alignment: Alignment.center,
                child: Text(
                  'item 2',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 130,
                color: Colors.black,
                alignment: Alignment.center,
                child: Text(
                  'item 3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 200,
                width: 130,
                color: Color.fromARGB(255, 207, 205, 205),
                alignment: Alignment.center,
                child: Text(
                  'item 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 130,
                color: Colors.black,
                alignment: Alignment.center,
                child: Text(
                  'item 2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 130,
                color: Color.fromARGB(255, 207, 205, 205),
                alignment: Alignment.center,
                child: Text(
                  'item 3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 200,
                width: 130,
                color: Colors.black,
                alignment: Alignment.center,
                child: Text(
                  'item 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 130,
                color: const Color.fromARGB(255, 207, 205, 205),
                alignment: Alignment.center,
                child: Text(
                  'item 2',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 130,
                color: Colors.black,
                alignment: Alignment.center,
                child: Text(
                  'item 3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
