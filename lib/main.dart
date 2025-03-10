import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx_flutter/pages/about_page.dart';
import 'package:learn_getx_flutter/pages/contact_page.dart';
import 'package:learn_getx_flutter/pages/home_page.dart';
import 'package:learn_getx_flutter/pages/to_do_page.dart';
import 'package:learn_getx_flutter/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.deepPurple[100],
        primarySwatch: Colors.deepPurple,
      ),
      getPages: allPage,
      home: const ToDoPage(),
    );
  }
}
