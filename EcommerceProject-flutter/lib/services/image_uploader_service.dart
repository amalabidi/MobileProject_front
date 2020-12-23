import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageUploader {
  final String imagesUrl = "http://192.168.1.2:3001/api/images";


  Future<String> uploadImage(base64EncodedImage) async {
    

    dynamic res = await http.post(imagesUrl, 
             
                body:json.encode({ "data": base64EncodedImage }) ,
                headers: { 'Content-Type': 'application/json' });

    if (res.statusCode == 200) {
    print("image uploaded");
   dynamic body = jsonDecode(res.body);
  print(body);
      return body["url"] ;
    } else {
      print("image uploaded");
      return "";
    }
  }


}
