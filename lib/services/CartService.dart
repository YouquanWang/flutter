class CartService {
  static addCart (json) {
    json = CartService.formatCartData(json);
    print(json);
  }
  static formatCartData (json) {
    final Map data = new Map<String, dynamic>();
    data['id'] = json.id;
    data['title'] = json.title;
    data['price'] = json.price;
    data['pic'] = json.pic;
    data['count'] = json.count;
    data['checked'] = true;

    return data;
  }
}