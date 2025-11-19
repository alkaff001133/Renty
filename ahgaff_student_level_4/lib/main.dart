import 'package:ahgaff_student/component/authentication/services/auth.dart';
import 'package:ahgaff_student/component/futureBuilder/api2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Auth())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      home: Api2(),
      // Api(),
      // Getstarted(),
      // About(),
      // Home2(),
      // Profile(),
      // Textspans(),
      // Rotatedboxs(),
      // Opacities(),
      // Spaces(),
      // Cardss(),
    );
  }
}
