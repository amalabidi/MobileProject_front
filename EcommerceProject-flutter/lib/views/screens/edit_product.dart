import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/models/product.dart';
import "dart:convert";
import 'dart:io';
import 'package:flutter_ecommerce_project/services/image_uploader_service.dart';
import 'package:flutter_ecommerce_project/views/widgets/admin_panel.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/add_image.dart';
import '../widgets/add_details.dart';
import '../widgets/customized_button.dart';
import '../../services/product_service.dart';

class EditProduct extends StatefulWidget {
  final Product oldProduct;
  final bool update;
  EditProduct({this.oldProduct, this.update});
  @override
  _State createState() => _State();
}

class _State extends State<EditProduct> {
  Map product;
  final imagepicker = ImagePicker();
  final ImageUploader imageUploader = new ImageUploader();

  @override
  void initState() {
    print(widget.oldProduct);
    product = widget.oldProduct.toJson();
    product['price'] =
        (product['price'] != null) ? product['price'].toString() : "";
    // =product['imgsUrl'] ?? [];
    print("///////////////////");
    print(product);
    product['imgsUrl'] =
        product['imgUrls'] == null ? new List<String>() : product['imgUrls'];
    super.initState();
  }
  //fct (value) bech tsati state l champ

  void attributeChangedHundler(String attributeName, dynamic value) {
    setState(() {
      product[attributeName] = value.toString();
    });
    print(product);
  }

  void supprimer(int i) {
    setState(() {
      product['imgsUrl'].removeAt(i);
    });
  }

  Future getImage() async {
    var pickerFile = await imagepicker.getImage(source: ImageSource.gallery);

    if (pickerFile != null) {
      final bytes = File(pickerFile.path).readAsBytesSync();
      String img64 = base64Encode(bytes);
      String url = await imageUploader.uploadImage(img64);
      setState(() {
        print("////////////////");
        product['imgsUrl'].add(url);
        print("////////////////");
      });
    }
  }

  ProductService productService = new ProductService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                AddImage(
                    urls: product["imgsUrl"],
                    handleDelete: supprimer,
                    handleAddClicked: getImage),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    left: 24.0,
                    right: 24.0,
                    bottom: 4.0,
                  ),
                  child: AddDetails(
                    update: widget.update,
                    product: product,
                    changedAtrribut: attributeChangedHundler,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomizedButton(
              textName: 'Cancel',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CustomizedButton(
              textName: 'Save',
              onPressed: () {
                widget.update
                    ? productService
                        .updateProduct(product)
                        .then((value) => Navigator.pop(context))
                    : productService
                        .addProduct(product)
                        .then((value) => Navigator.pop(context));
              },
            ),
          ],
        ),
      ),
    );
  }
}
