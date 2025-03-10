import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx_flutter/components/bottomsheet_getx.dart';
import 'package:learn_getx_flutter/components/dialogbox_getx.dart';
import 'package:learn_getx_flutter/components/snackbar_getx.dart';

class SnackbarGetx extends StatefulWidget {
  const SnackbarGetx({super.key});

  @override
  State<SnackbarGetx> createState() => _SnackbarGetxState();
}

class _SnackbarGetxState extends State<SnackbarGetx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter GetX'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      MySnackBar();
                    },
                    child: const Text('Show SnackBar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      MyDialogBox();
                    },
                    child: const Text('Show Dialog Box'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      MyBottomSheet();
                    },
                    child: const Text('Show BottomSheet'),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/about');
                        },
                        child: const Text('About Page'),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/contact');
                        },
                        child: const Text('Contact Page'),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
