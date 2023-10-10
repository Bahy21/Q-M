class DashBoardModel {
  List<dynamic>? images;
  String? terms;
  String? privacy;

  DashBoardModel({this.images, this.terms, this.privacy});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
    images =  json['imgs']??[];
    terms = json['terms']??"";
    privacy = json['privacy']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgs'] = this.images;
    data['terms'] = this.terms;
    data['privacy'] = this.privacy;
    return data;
  }
}