import 'package:get/get.dart';
import 'package:learn_getx_flutter/pages/counter_page.dart';
import 'package:learn_getx_flutter/pages/to_do_page.dart';

import '../pages/about_page.dart';
import '../pages/contact_page.dart';
import '../pages/home_page.dart';

final allPage = [
  GetPage(
    name: '/',
    page: () => const SnackbarGetx(),
  ),
  GetPage(
    name: '/about',
    page: () => const AboutPage(),
    // hieu ung chuyen screen
    // transition: Transition.leftToRight,
  ),
  GetPage(
    name: '/contact',
    page: () => const ContactPage(),
    // hieu ung chuyen screen
    // transition: Transition.rightToLeft,
  ),
  GetPage(
    name: '/counter',
    page: () => const CounterPage(),
    // hieu ung chuyen screen
    // transition: Transition.rightToLeft,
  ),
  GetPage(
    name: '/todo',
    page: () => const ToDoPage(),
    // hieu ung chuyen screen
    // transition: Transition.rightToLeft,
  ),
];
