import 'package:flutter/material.dart';

class GridsViews extends StatelessWidget {
  const GridsViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid View Demo')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return GridTile(
            header: GridTileBar(
              trailing: Icon(Icons.add),
              leading: Icon(Icons.menu),
              title: Text('Item $index'),
              backgroundColor: Colors.black45,
            ),
            footer: GridTileBar(
              title: Text('Footer $index'),
              trailing: Icon(Icons.favorite),
              backgroundColor: Colors.black45,
            ),
            child: Image.asset(
              'assets/images/avatar-2.webp',
              fit: BoxFit.cover,
            ),
          );
        },
      ),

      // GridView.count.......................
      //     GridView.count(
      //   crossAxisCount: 2,
      //   crossAxisSpacing: 10,
      //   mainAxisSpacing: 10,
      //   children: List.generate(20, (index) {
      //     return Container(
      //       color: Colors.amber,
      //       child: Center(
      //         child: Text(
      //           'Item $index',
      //           style: TextStyle(fontSize: 20, color: Colors.white),
      //         ),
      //       ),
      //     );
      //   }),
      // ),
      // body: GridView(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //   ),
      //   children: List.generate(20, (index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: Container(
      //         height: 50,
      //         width: 50,
      //         decoration: BoxDecoration(
      //           color: Colors.teal,
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      //         alignment: Alignment.center,
      //         child: Text(
      //           'Item $index',
      //           style: TextStyle(
      //             fontSize: 20,
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //     );
      //   }),
      // ),
    );
  }
}



// GridView.count.......................
// GridView.count(
//         crossAxisCount: 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//         children: List.generate(20, (index) {
//           return Container(
//             color: Colors.amber,
//             child: Center(
//               child: Text(
//                 'Item $index',
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ),
//           );
//         }),
//       ),





// GridView.builder.......................
// GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: 20,
//         itemBuilder: (context, index) {
//           return GridTile(
//             header: GridTileBar(
//               trailing: Icon(Icons.add),
//               leading: Icon(Icons.map),
//               title: Text('Item $index'),
//               backgroundColor: Colors.black45,
//             ),
//             footer: GridTileBar(
//               title: Text('Footer $index'),
//               trailing: Icon(Icons.favorite),
//               backgroundColor: Colors.black45,
//             ),
//             child: Image.network(
//               'https://tinyurl.com/yc4pctt5',
//               fit: BoxFit.cover,
//             ),
//           );
//         },
//       ),