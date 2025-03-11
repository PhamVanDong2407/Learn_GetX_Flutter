import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/api_to_do.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    // Lấy instance của ToDoApi_Controller
    ToDoApi_Controller toDoApi_Controller = Get.put(ToDoApi_Controller());

    return Scaffold(
      appBar: AppBar(
        title: const Text('T O D O'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            addNewToDo(textEditingController, toDoApi_Controller);
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add_circle,
                color: Colors.white,
                size: 28,
              ),
              SizedBox(width: 8),
              Text(
                'Add New Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'All Todos',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(
                  () {
                    if (toDoApi_Controller.TodoList.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: toDoApi_Controller.TodoList.length,
                        itemBuilder: (context, i) {
                          final todo = toDoApi_Controller.TodoList[i];
                          return Container(
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      todo.title ?? 'Chưa có tiêu đề!',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        textEditingController.text = todo.title ?? '';
                                        Get.defaultDialog(
                                          title: 'Update Task',
                                          content: Column(
                                            children: [
                                              TextFormField(
                                                controller: textEditingController,
                                                decoration: const InputDecoration(
                                                  hintText: 'Enter Task...',
                                                  border: OutlineInputBorder(),
                                                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  OutlinedButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    style: OutlinedButton.styleFrom(
                                                      side: const BorderSide(color: Colors.deepPurple),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                    ),
                                                    child: const Text('Cancel',
                                                        style: TextStyle(color: Colors.deepPurple)),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      if (todo.id != null) {
                                                        toDoApi_Controller.updateToDo(
                                                            todo.id ?? "", textEditingController.text);
                                                        Get.back();
                                                      } else {
                                                        Get.snackbar(
                                                            'Lỗi', 'Không thể cập nhật task này vì không có ID',
                                                            snackPosition: SnackPosition.BOTTOM,
                                                            backgroundColor: Colors.red,
                                                            colorText: Colors.white);
                                                      }
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: Colors.deepPurple,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                    ),
                                                    child: const Text('Save', style: TextStyle(color: Colors.white)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.edit, color: Colors.white),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        if (todo.id != null) {
                                          toDoApi_Controller.deleteToDo(todo.id ?? "");
                                        } else {
                                          Get.snackbar('Lỗi', 'Không thể xóa task này vì không có ID',
                                              snackPosition: SnackPosition.BOTTOM,
                                              backgroundColor: Colors.red,
                                              colorText: Colors.white);
                                        }
                                      },
                                      icon: const Icon(Icons.delete, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addNewToDo(TextEditingController textEditingController, ToDoApi_Controller toDoApi_Controller) {
    Get.defaultDialog(
      title: 'Enter new Task',
      content: Column(
        children: [
          TextFormField(
            controller: textEditingController,
            decoration: const InputDecoration(
              hintText: 'Enter Task...',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.deepPurple),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Cancel', style: TextStyle(color: Colors.deepPurple)),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (textEditingController.text.isNotEmpty) {
                    toDoApi_Controller.addToDo(textEditingController.text);
                    textEditingController.clear();
                    Get.back();
                  } else {
                    Get.snackbar('Lỗi', 'Vui lòng nhập nội dung task',
                        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
