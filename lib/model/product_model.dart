import 'package:json_annotation/json_annotation.dart'; 
  
part 'product_model.g.dart';


@JsonSerializable()
  class productModel extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'msg')
  String msg;

  productModel(this.status,this.data,this.total,this.msg,);

  factory productModel.fromJson(Map<String, dynamic> srcJson) => _$productModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$productModelToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'pic')
  String pic;

  @JsonKey(name: 'price')
  String price;

  Data(this.id,this.title,this.pic,this.price,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}
