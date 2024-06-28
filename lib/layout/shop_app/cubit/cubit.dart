
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit/states.dart';
import 'package:shop_app/models/shop_app/category_model.dart';
import 'package:shop_app/models/shop_app/home_model.dart';
import 'package:shop_app/modules/shop_app/favorites/favorites.dart';
import 'package:shop_app/modules/shop_app/products/product_screen.dart';
import 'package:shop_app/modules/shop_app/search_screen/search_screen.dart';
import 'package:shop_app/modules/shop_app/settings_screen/settings.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../../models/shop_app/change_fav_model.dart';
import '../../../modules/shop_app/categories/cateogries.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  // عملت list of widget عشان اقدر اتحرك في bottomNav
  List<Widget> bottomScreen = [
    ProductScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];


   // عشان لما اجي اضغط علي ايقونه اللي هو ال index من ال bottomNav
   // يساوي ال currentIndex
  void changeBottom(index)
  {
    currentIndex = index;
    emit(ChangeBottomNav());
  }


  Map<int, bool?> favorites = {};


 // هنا عملت variable والنوع بتاعه HomeModel عشان دا class مينفعش ااكسز بيه عشان اجيب ال Data
  HomeModel? homeModel;
  //  عملت method عشان استدعي ال method اللي في dioHelper واعطيها ال url وال token
  //  وبعدها استدعي ال variable homeModel وااكسز عليه عشان اجيب ال data منه
  void getHomeData()
  {

    emit(ShopLoadingHomeState());
    // حفظت ال token في ملف constants
    // واستدعيته هنا في ال method اللي في dioHelper
    DioHelper.getData(url: HOME, token: token ).then((value)
    {
      homeModel = HomeModel.fromJson(value?.data);
    //  printFullText(homeModel?.data.banners![0].image);
     // print(homeModel?.status);
      print(homeModel.toString());
      homeModel?.data.products?.forEach((element) {
        favorites.addAll({
          element.id : element.inFavorites,
        });
      });
      print(favorites.toString());

      emit(ShopSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorState());
    });
  }





  CategoryModel? categoryModel;
  void getCategoriesData()
  {
    DioHelper.getData(url: CATEGOTY, token: token ).then((value)
    {
      categoryModel = CategoryModel.fromJson(value?.data);
      emit(ShopSuccessCategoryState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorCategoryState());
    });
  }



  ChangeFavModel? changeFavModel;
  void changeFavorites(int productId)
  {
    favorites[productId] =  !favorites[productId]!;
    DioHelper.postData(
      url: FAVORTIES,
      data:
      {
        'product_id' : productId,
      },
      token: 'tG6liT4G3MFpRwb7Et9mvRuTq1uD6yQnRmZ1tDUK5kxplDHXtxf8IMnCfDJB2d8fdoemrD',
    ).then((value)
    {
      changeFavModel = ChangeFavModel.FromJson(value?.data);
      print(value?.data);
      emit(ShopSuccessChangeFavoritesState());
    }).catchError((error)
    {
      print(error.toString());
      emit( ShopErrorChangeFavoritesState());

    });
  }

}