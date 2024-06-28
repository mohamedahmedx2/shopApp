import 'dart:math';

import 'package:flutter/cupertino.dart';



// عملت class homeModel عشان هيكون فيها status و data
class HomeModel
{
  late bool status ;
  // هنا خليت نوع ال variable اللي اسمه data من نفس نوع ال class اللي هيجيب ال data كلها
  late HomeDataModel data;

  // عملت هنا named constructor
  // وسميته اسم عشان اقدر اجيب ال data منه اللي هو json
  HomeModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    data =  HomeDataModel.fromJson(json['data']) ;
  }
}

//  عملت classData عشان لقيت ال data فيها banners و products
class HomeDataModel {
  // لقيت ال banners و products عباره عن list فعلمت class لكل واحد فيهم
  // واعطيته الحاجات اللي كان طالبها في ال postman
  // وجبت اسم ال class بتاع كل واحد فيهم وخليته list<اسم الكلاس بتاعهم>
  List<BannerModel>? banners;
  List<ProductModel>? products;
// عملت Constructor عادي
  HomeDataModel({this.banners, this.products});
// وهنا عملت جملة if و forEach عشان ال data متجيش ب null
  HomeDataModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <BannerModel>[];
      json['banners'].forEach((v) {
        banners!.add(BannerModel.fromJson(v));
      });
    }
    // وهنا عملت جملة if و forEach عشان ال data متجيش ب null
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
  }
}
// class HomeDataModel
// {
//   List<BannerModel> banners = [];
//   List<ProductModel> products = [];
//   HomeDataModel.fromJson(Map<String, dynamic> json)
//   {
//     json['banners'].forEach((element)
//     {
//       banners.add(element);
//     });
//
//     json['products'].forEach((element)
//     {
//       products.add(element);
//     });
//   }
// }



class BannerModel {
int? id;
String? image;

BannerModel({this.id, this.image});

BannerModel.fromJson(Map<String, dynamic> json) {
id = json['id'];
image = json['image'];
}
}


// class BannerModel
// {
//   late int id;
//   late String image;
//
//   BannerModel.fromJson(Map<String, dynamic> json)
//   {
//     id = json['id'];
//     image = json['image'];
//   }
// }

class ProductModel
{
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late bool inFavorites;
  late bool inCart;

  ProductModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}