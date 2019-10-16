  
// import 'dart:convert';
// import 'dart:io';
// import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
  
class TeamPage extends StatefulWidget {
  @override
  _TeamPage createState() => _TeamPage();
}

class _TeamPage extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('拍照'),
        onPressed: () {
          this.showBottomSheet(context);
        },
      ),
    );
  }
   void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("拍照上传"),
                  onTap: () {
                    this._takePhoto();
                    Navigator.pop(context, '拍照上传');
                  },
                ),
                ListTile(
                  title: Text("从相册选择"),
                  onTap: () {
                    this._openGallery();
                    Navigator.pop(context, '从相册选择');
                  },
                )
              ],
            ),
          );
        });
  }
  /*拍照*/
  _takePhoto() async {
    
     var image = await ImagePicker.pickImage(source: ImageSource.camera,maxWidth:400);
print(image);
      this._uploadImage(image);

  }

  /*相册*/
  _openGallery() async {
     var image = await ImagePicker.pickImage(source: ImageSource.gallery,maxWidth:400);
     print(image);
     this._uploadImage(image);
  }
  //上传图片
  _uploadImage(_imageDir) async{
    String path = _imageDir.path;
    String name = path.substring(path.lastIndexOf("/") + 1, path.length);
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(path, filename: name),
      });
        Dio dio = new Dio();
      var response = await dio.post("https://www.wangyouquanyes.cn/mainPic", data: formData,options: Options(contentType:Headers.formUrlEncodedContentType ));

      print(response);
  }
}
