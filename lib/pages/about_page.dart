import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/text_editing_controller.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Đăng ký và sử dụng TextEditingControllerClass với GetX
    final TextEditingControllerClass textController = Get.put(TextEditingControllerClass());

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Name : ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        // Sử dụng Obx để lắng nghe thay đổi của name và cập nhật giao diện
                        Obx(
                          () => Text(
                            textController.name.value.isEmpty ? 'Khoapadi' : textController.name.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Hiển thị dialog để người dùng nhập tên mới
                            Get.defaultDialog(
                              title: "Enter your name",
                              content: Column(
                                children: [
                                  Row(
                                    children: [
                                      // TextFormField sử dụng controller để theo dõi giá trị
                                      Expanded(
                                        child: TextFormField(
                                          controller: TextEditingController(text: textController.name.value),
                                          // Khởi tạo giá trị cho TextFormField
                                          decoration: const InputDecoration(
                                            labelText: "Name",
                                          ),
                                          onChanged: (value) {
                                            textController
                                                .updateName(value); // Cập nhật giá trị của name khi người dùng nhập
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Nút Cancel
                                      OutlinedButton(
                                        onPressed: () {
                                          Get.back(); // Đóng dialog khi nhấn Cancel
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      const SizedBox(width: 20),
                                      // Nút Save
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.back(); // Đóng dialog khi nhấn Save
                                        },
                                        child: const Text('Save'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
