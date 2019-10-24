// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

productModel _$productModelFromJson(Map<String, dynamic> json) {
  return productModel(
    json['status'] as int,
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['total'] as int,
    json['msg'] as String,
  );
}

Map<String, dynamic> _$productModelToJson(productModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'total': instance.total,
      'msg': instance.msg,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['id'] as int,
    json['title'] as String,
    json['pic'] as String,
    json['price'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pic': instance.pic,
      'price': instance.price,
    };
