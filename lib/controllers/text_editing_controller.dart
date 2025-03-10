import 'package:get/get.dart';

class TextEditingControllerClass extends GetxController {
  var name = ''.obs; // Đây là biến quản lý giá trị của trường nhập liệu

  // Hàm để cập nhật tên
  void updateName(String newName) {
    name.value = newName;
  }
}
