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

  // Lấy danh sách todos
  Future<void> getTodo() async {
    final response = await http.get(Uri.parse("https://67cea20a125cd5af757b4f1b.mockapi.io/api/todolist"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      List<ToDoModel> newList = [];
      for (Map<String, dynamic> index in data) {
        newList.add(ToDoModel.fromJson(index));
      }
      TodoList.value = newList;
    } else {
      print('Không thể tải dữ liệu');
    }
  }

  // Thêm một ToDo mới
  Future<void> addToDo(String title) async {
    final response = await http.post(
      Uri.parse("https://67cea20a125cd5af757b4f1b.mockapi.io/api/todolist"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title}),
    );

    if (response.statusCode == 201) {
      // Gọi lại getTodo() để làm mới danh sách
      getTodo();
    } else {
      print('Không thể thêm ToDo');
    }
  }

  // Cập nhật thông tin ToDo
  Future<void> updateToDo(String id, String title) async {
    final response = await http.put(
      Uri.parse("https://67cea20a125cd5af757b4f1b.mockapi.io/api/todolist/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title}),
    );

    if (response.statusCode == 200) {
      // Gọi lại getTodo() để làm mới danh sách
      getTodo();
    } else {
      print('Không thể cập nhật ToDo');
    }
  }

  // Xóa một ToDo
  Future<void> deleteToDo(String id) async {
    final response = await http.delete(
      Uri.parse("https://67cea20a125cd5af757b4f1b.mockapi.io/api/todolist/$id"),
    );

    if (response.statusCode == 200) {
      // Gọi lại getTodo() để làm mới danh sách
      getTodo();
    } else {
      print('Không thể xóa ToDo');
    }
  }
}
