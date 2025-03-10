import 'package:get/get.dart';

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
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: '/contact',
    page: () => const ContactPage(),
    // hieu ung chuyen screen
    transition: Transition.rightToLeft,
  ),
];
