// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

productDetailModel _$productDetailModelFromJson(Map<String, dynamic> json) {
  return productDetailModel(
    json['status'] as int,
    json['data'] == null
        ? null
        : DetialContent.fromJson(json['data'] as Map<String, dynamic>),
    json['msg'] as String,
  );
}

Map<String, dynamic> _$productDetailModelToJson(productDetailModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'msg': instance.msg,
    };

DetialContent _$DetialContentFromJson(Map<String, dynamic> json) {
  return DetialContent(
    json['id'] as int,
    json['title'] as String,
    json['pic'] as String,
    json['price'] as String,
    json['catid'] as int,
    json['content'] as String,
    json['time'] as String,
    json['visits'] as int,
    json['istop'] as int,
    json['status'] as int,
    json['recommend'] as int,
    json['author'] as String,
    json['groupImg'] as String,
    json['attr'] as String
  );
}

Map<String, dynamic> _$DetialContentToJson(DetialContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pic': instance.pic,
      'price': instance.price,
      'catid': instance.catid,
      'content': instance.content,
      'time': instance.time,
      'visits': instance.visits,
      'istop': instance.istop,
      'status': instance.status,
      'recommend': instance.recommend,
      'author': instance.author,
      'groupImg': instance.groupImg,
      'attr': instance.attr
    };
