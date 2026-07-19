import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/screens/counter/view/counter_view.dart';
import 'package:getx_example/screens/home_view/controller/home_controller.dart';
import 'package:getx_example/screens/settings/view/setting_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu, color: Colors.white),
        ),
        title: Text("To-Do", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      drawer: Drawer(
        child: Column(
          spacing: 10,
          children: [
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black87,
              ),
              child: Icon(Icons.person, color: Colors.white, size: 36),
            ),
            Text(
              "Muhammad Athar",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            Divider(color: Colors.black87),
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("Counter"),
              onTap: () {
                Get.to(() => CounterView());
              },
            ),
            ListTile(leading: Icon(Icons.person), title: Text("Profile")),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SettingView()),
                // );
                Get.to(() => SettingView());
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            GetBuilder(
              init: controller,
              builder: (_) {
                return ListView.separated(
                  itemCount: controller.todoList.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          width: 400,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.black, Colors.black54],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.todoList[index].title ?? "N/A",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      controller.todoList[index].description ??
                                          "N/A",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      controller.todoList[index].createdAt
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.edit, color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.deleteTodo(todoId: controller.todoList[index].id);
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addTodo(context);
        },
        backgroundColor: Colors.black87,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
