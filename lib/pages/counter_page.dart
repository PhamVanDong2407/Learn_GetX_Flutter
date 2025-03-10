import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx_flutter/controllers/counter_controller.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put() dùng để khởi tạo và đăng ký controller vào bộ nhớ.
    // 'counter_controller' là controller quản lý trạng thái bộ đếm.
    counter_controller counter = Get.put(counter_controller());

    // Xây dựng giao diện người dùng
    return Scaffold(
      appBar: AppBar(), // AppBar là thanh công cụ phía trên màn hình
      body: SafeArea(
        // SafeArea giúp bảo vệ các phần tử giao diện khỏi bị che khuất bởi các thành phần như tai thỏ, thanh trạng thái...
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các phần tử trong Row
          children: [
            Column(
              children: [
                const SizedBox(height: 50), // Khoảng cách giữa các phần tử, trong trường hợp này là 50px
                Obx(
                  // Obx là một widget của GetX, dùng để lắng nghe thay đổi trạng thái và tự động cập nhật giao diện khi dữ liệu thay đổi
                  () => Text(
                    counter.num5.toString(), // Hiển thị giá trị của biến num5 trong controller, chuyển thành chuỗi
                    style: const TextStyle(
                      color: Colors.white, // Màu chữ là trắng
                      fontSize: 100, // Kích thước chữ là 100px
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        counter.num5++;
                        print(counter.num5);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 50,
                      ),
                    ),
                    const SizedBox(width: 30),
                    IconButton(
                      onPressed: () {
                        counter.num5--;
                        print(counter.num5);
                      },
                      icon: const Icon(
                        Icons.minimize,
                        size: 50,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
