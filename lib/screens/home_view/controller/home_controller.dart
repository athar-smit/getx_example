import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/models/todo_data_model.dart';

class HomeController extends GetxController {
  final List<TodoDetail> todoList = [];
  @override
  onInit() {
    super.onInit();
    getTodoList();
  }

  getTodoList() async {
    final response = await Dio().get("https://api.freeapi.app/api/v1/todos");
    print(response.data);

    todoList.clear();

    todoList.addAll(TodoDataModel.fromJson(response.data).data);

    update();
  }

  createTodo({required String title, required String description}) async {
    await Dio().post(
      "https://api.freeapi.app/api/v1/todos/",
      data: {"description": description, "title": title},
    );
    await getTodoList();
  }

  deleteTodo({required String todoId}) async {
    await Dio().delete("https://api.freeapi.app/api/v1/todos/${todoId}");
    getTodoList();
  }

  void addTodo(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: 300,
            padding: EdgeInsets.all(12),
            child: Column(
              spacing: 12,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add Your ToDo",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: titleController,
                  minLines: 1,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Enter Title",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  minLines: 4,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Write your description",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          createTodo(
                            title: titleController.text,
                            description: descriptionController.text,
                          );
                          Navigator.pop(context);
                          update();
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.black87,
                          ),
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
