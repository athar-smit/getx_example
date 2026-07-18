class TodoDataModel {
    TodoDataModel({
        required this.statusCode,
        required this.data,
        required this.message,
        required this.success,
    });

    final int? statusCode;
    final List<TodoDetail> data;
    final String? message;
    final bool? success;

    factory TodoDataModel.fromJson(Map<String, dynamic> json){ 
        return TodoDataModel(
            statusCode: json["statusCode"],
            data: json["data"] == null ? [] : List<TodoDetail>.from(json["data"]!.map((x) => TodoDetail.fromJson(x))),
            message: json["message"],
            success: json["success"],
        );
    }

}

class TodoDetail {
    TodoDetail({
        required this.id,
        required this.title,
        required this.description,
        required this.isComplete,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String? id;
    final String? title;
    final String? description;
    final bool? isComplete;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    factory TodoDetail.fromJson(Map<String, dynamic> json){ 
        return TodoDetail(
            id: json["_id"],
            title: json["title"],
            description: json["description"],
            isComplete: json["isComplete"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"],
        );
    }

}
