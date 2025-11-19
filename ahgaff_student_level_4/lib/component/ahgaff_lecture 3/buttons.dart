import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // icon button ..............
            // IconButton(
            //   onPressed: () {
            //     print('Icon Button Pressed');
            //   },
            //   icon: Icon(Icons.add),
            //   color: Colors.white,
            //   iconSize: 50,
            //   tooltip: 'This is Icon Button',
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStatePropertyAll(Colors.blue),
            //   ),
            // ),

            // Elevated Button ..............
            // ElevatedButton(
            //   onPressed: () {
            //     print('Elevated Button Pressed');
            //   },
            //   child: Text('Elevated Button'),
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStatePropertyAll(Colors.amberAccent),
            //   ),
            // ),
            MaterialButton(
              onPressed: () {},
              height: 80,
              minWidth: 250,
              child: Text(
                "data",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              color: Colors.teal,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
