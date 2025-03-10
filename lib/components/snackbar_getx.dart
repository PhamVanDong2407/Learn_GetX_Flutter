import 'package:flutter/material.dart';
import 'package:get/get.dart';

void MySnackBar() {
  Get.snackbar(
    'Chuc mung ban dang nhap thanh cong',
    'Chao mung quay tro lai',

    // Huong hien thi cua thong bao
    snackPosition: SnackPosition.BOTTOM,

    // Mau nen o thong bao
    backgroundColor: Colors.deepPurple[300],

    // Mau chu
    colorText: Colors.white,

    // titleText:const Text('Second Title'),
    // messageText: const Text('Second Message'),

    // Thiet lap thoi gian hien thi SnackBar
    animationDuration: const Duration(seconds: 2),

    // Thiet lap thoi gian hien thi SnackBar (dung nhieu hon)
    duration: const Duration(seconds: 5),

    borderRadius: 30,

    // Icon trong SnackBar
    icon: const Icon(
      Icons.notifications,
      size: 30,
      color: Colors.white,
    ),
    // Cho phép người dùng vuốt ngang (trái hoặc phải) để xóa một widget
    dismissDirection: DismissDirection.horizontal,

    // FALSE có nghĩa là người dùng không thể vuốt hoặc tương tác để xóa hoặc ẩn widget này. Con TRUE la xoa duoc
    isDismissible: false,

    //  một thuộc tính của một số widget thông báo (như SnackBar) để thêm một nút chính vào thông báo.
    mainButton: TextButton(
      onPressed: () {},
      child: const Text(
        'Done',
        style: TextStyle(color: Colors.white),
      ),
    ),
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(bottom: 10),
  );
}
