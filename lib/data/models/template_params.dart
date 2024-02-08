class TemplateParams {
  String? fromName;
  String? toName;
  String? message;

  TemplateParams({this.fromName, this.toName, this.message});

  TemplateParams.fromJson(Map<String, dynamic> json) {
    fromName = json['from_name'];
    toName = json['to_name'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['from_name'] = fromName;
    data['to_name'] = toName;
    data['message'] = message;
    return data;
  }
}