import 'package:json_annotation/json_annotation.dart'; 
  
part 'product_detail_model.g.dart';


@JsonSerializable()
  class productDetailModel extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'data')
  DetialContent data;

  @JsonKey(name: 'msg')
  String msg;

  productDetailModel(this.status,this.data,this.msg,);

  factory productDetailModel.fromJson(Map<String, dynamic> srcJson) => _$productDetailModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$productDetailModelToJson(this);

}

  
@JsonSerializable()
  class DetialContent extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'pic')
  String pic;

  @JsonKey(name: 'price')
  String price;

  @JsonKey(name: 'catid')
  int catid;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'visits')
  int visits;

  @JsonKey(name: 'istop')
  int istop;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'recommend')
  int recommend;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'groupImg')
  String groupImg;

  @JsonKey(name: 'attr')
  String attr;

  @JsonKey(name: 'count')
  int count = 1;
  DetialContent(this.id,this.title,this.pic,this.price,this.catid,this.content,this.time,this.visits,this.istop,this.status,this.recommend,this.author,this.groupImg,this.attr);

  factory DetialContent.fromJson(Map<String, dynamic> srcJson) => _$DetialContentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DetialContentToJson(this);

}

  
