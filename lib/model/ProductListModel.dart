class ProductListModel{
  int status;
  String info;
  Data data;

  ProductListModel({this.status, this.info, this.data});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    info = json['info'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['info'] = this.info;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int total;
  int perPage;
  int currentPage;
  List<DataList> data;

  Data({this.total, this.perPage, this.currentPage, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<DataList>();
      json['data'].forEach((v) {
        data.add(new DataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataList {
  String productId;
  String productName;
  String image;
  String imageThumb;
  int lookNum;
  int sellNum;
  int sellType;
  String sellPrice;
  String marketPrice;
  String score;
  int categoryId;
  String symbolPrice;
  String active;
  String storeName;
  int userId;
  int stock;
  int sellNumMonth;
  int isNew;

  DataList(
      {this.productId,
      this.productName,
      this.image,
      this.imageThumb,
      this.lookNum,
      this.sellNum,
      this.sellType,
      this.sellPrice,
      this.marketPrice,
      this.score,
      this.categoryId,
      this.symbolPrice,
      this.active,
      this.storeName,
      this.userId,
      this.stock,
      this.sellNumMonth,
      this.isNew});

  DataList.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    image = json['image'];
    imageThumb = json['image_thumb'];
    lookNum = json['look_num'];
    sellNum = json['sell_num'];
    sellType = json['sell_type'];
    sellPrice = json['sell_price'];
    marketPrice = json['market_price'];
    score = json['score'];
    categoryId = json['category_id'];
    symbolPrice = json['symbol_price'];
    active = json['active'];
    storeName = json['store_name'];
    userId = json['user_id'];
    stock = json['stock'];
    sellNumMonth = json['sell_num_month'];
    isNew = json['is_new'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['image'] = this.image;
    data['image_thumb'] = this.imageThumb;
    data['look_num'] = this.lookNum;
    data['sell_num'] = this.sellNum;
    data['sell_type'] = this.sellType;
    data['sell_price'] = this.sellPrice;
    data['market_price'] = this.marketPrice;
    data['score'] = this.score;
    data['category_id'] = this.categoryId;
    data['symbol_price'] = this.symbolPrice;
    data['active'] = this.active;
    data['store_name'] = this.storeName;
    data['user_id'] = this.userId;
    data['stock'] = this.stock;
    data['sell_num_month'] = this.sellNumMonth;
    data['is_new'] = this.isNew;
    return data;
  }
}