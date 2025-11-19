import 'package:flutter/material.dart';

class Part2 extends StatelessWidget {
  const Part2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Part 2',
          style: TextStyle(
            fontFamily: 'Mustopha',
            color: Colors.white,
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 2, 63, 113),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/avatar-2.webp"),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: 350,

              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.person),
                  Text(
                    "Name: ",
                    style: TextStyle(
                      fontFamily: 'Mustopha',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    " Abdullah Bazar",
                    style: TextStyle(
                      fontFamily: 'Mustopha',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: 350,

              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 10),
                  Text(
                    "Contact-No: ",
                    style: TextStyle(
                      fontFamily: 'Mustopha',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    " +967 780 559 264",
                    style: TextStyle(
                      fontFamily: 'Mustopha',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: 350,

              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 10),
                  Text(
                    "Email: ",
                    style: TextStyle(
                      fontFamily: 'Mustopha',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    " AbdullahBazar@gmail.com",
                    style: TextStyle(
                      fontFamily: 'Mustopha',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: 350,

              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.social_distance),
                  SizedBox(width: 10),
                  Text(
                    "Social media-links: ",
                    style: TextStyle(
                      fontFamily: 'Mustopha',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.facebook, color: Colors.blue),
                  SizedBox(width: 10),
                  Icon(Icons.phone, color: Colors.green),
                  SizedBox(width: 10),
                  Icon(Icons.telegram, color: Colors.blue),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              width: 350,
              alignment: Alignment.center,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [Colors.blue, Colors.purple, Colors.grey],
                    tileMode: TileMode.mirror,
                  ).createShader(
                    Rect.fromLTRB(bounds.left, 0, bounds.right, 0),
                  );
                  // ).createShader(bounds);
                },
                child: Text(
                  "Skills: Flutter, Dart, C++, Python",
                  style: TextStyle(
                    fontFamily: 'Mustopha',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              width: 350,

              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xf425f4ee),
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple, Colors.grey],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                "Flutter Developer",
                style: TextStyle(
                  fontFamily: 'Mustopha',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      // backgroundColor: const Color.fromARGB(255, 18, 102, 170),
    );
  }
}
