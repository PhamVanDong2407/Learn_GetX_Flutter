import 'package:flutter/material.dart';
import 'package:get/get.dart';

void MyDialogBox() {
  Get.defaultDialog(
    // Text thong bao lon
    title: 'Chuc mung ban',

    // Text noi dung thong bao
    middleText: 'Phan thuong cua ban la 1 trieu dong',

    content: Column(
      children: [
        Text('Hello Moi Nguoi'),
        Text('Chao mung da quay lai'),
        Row(
          children: [
            Expanded(
              child: TextFormField(),
            ),
          ],
        )
      ],
    ),

    titlePadding: const EdgeInsets.all(10),
    contentPadding: const EdgeInsets.all(10),

    radius: 10,

    // hanh dong cua thong bao
    actions: [
      OutlinedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('Cancel'),
      ),
      ElevatedButton(
        onPressed: () {
          print('Done');
        },
        child: const Text('Done'),
      ),
    ],

    // mau nen thong bao
    backgroundColor: Colors.deepPurple[100],

    // onCancel: () {},
    // onConfirm: () {},
  );
}
