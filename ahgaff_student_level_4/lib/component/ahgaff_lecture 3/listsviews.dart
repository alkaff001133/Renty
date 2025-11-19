import 'package:flutter/material.dart';

class Listsviews extends StatelessWidget {
  const Listsviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View Demo')),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.language),
            title: Text('Language $index'),
            iconColor: Colors.amber,
            textColor: Colors.white,
            tileColor: Colors.grey,
          );
        },
        separatorBuilder: (context, index) {
          return Divider(color: Colors.black);
        },
        itemCount: 100,

        // scrollDirection: Axis.horizontal, // to make it horizontal
        // reverse: true, // to make it reverse (bottom to top
      ),
    );
  }
}


// ListView(
//         children: [
//           ListTile(
//             leading: Icon(Icons.map),
//             title: Text('Map'),
//             iconColor: Colors.amber,
//             textColor: Colors.blue,
//           ),
//           ListTile(leading: Icon(Icons.photo_album), title: Text('Album')),
//           ListTile(leading: Icon(Icons.phone), title: Text('Phone')),
//         ],
// ),

// ListView(
      //   children: [
      //     ListTile(
      //       leading: Icon(Icons.person),
      //       title: Text('Profile'),
      //       iconColor: Colors.amber,
      //       textColor: Colors.blue,
      //     ),
      //     Divider(color: Colors.black),
      //     ListTile(
      //       leading: Icon(Icons.language),
      //       title: Text('Language'),
      //       iconColor: Colors.amber,
      //       textColor: Colors.blue,
      //     ),
      //     Divider(color: Colors.black),
      //     ListTile(
      //       leading: Icon(Icons.search),
      //       title: Text('Search'),
      //       iconColor: Colors.amber,
      //       textColor: Colors.blue,
      //     ),
      //     Divider(color: Colors.black),
      //     ListTile(
      //       leading: Icon(Icons.settings),
      //       title: Text('Settings'),
      //       iconColor: Colors.amber,
      //       textColor: Colors.blue,
      //     ),
      //     Divider(color: Colors.black),
      //   ],
      // ),