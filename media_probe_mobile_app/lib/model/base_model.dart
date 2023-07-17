class BaseModel {

  BaseModel({
    this.status,
    this.message,
  });
  BaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool?;
    message = json['message']?.toString();
  }
  bool? status;
  String? message;
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
