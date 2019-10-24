class ProductListModel {
  List<Data> data;

  ProductListModel({this.data});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String title;
  String pic;
  String price;

  Data({this.id, this.title, this.pic, this.price});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    pic = json['pic'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['pic'] = this.pic;
    data['price'] = this.price;
    return data;
  }
}
