import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learn_getx_flutter/models/to_do_model.dart';

class ToDoApi_Controller extends GetxController {
  var TodoList = RxList<ToDoModel>();

  @override
  void onInit() {
    super.onInit();
    getTodo();
  }

  Future<void> getTodo() async {
    // Gửi yêu cầu GET đến API
    final response = await http.get(Uri.parse("https://67cea20a125cd5af757b4f1b.mockapi.io/api/todolist"));

    // Kiểm tra mã trạng thái của phản hồi
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      // Tạo danh sách ToDoModel mới từ dữ liệu trả về
      List<ToDoModel> newList = [];
      for (Map<String, dynamic> index in data) {
        newList.add(ToDoModel.fromJson(index));
      }

      // Cập nhật TodoList với danh sách mới
      TodoList.value = newList;
    } else {
      // Xử lý khi có lỗi hoặc phản hồi không thành công
      print('Không thể tải dữ liệu');
    }
  }
}
