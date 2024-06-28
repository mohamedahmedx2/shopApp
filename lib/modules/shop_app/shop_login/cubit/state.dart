

import 'package:shop_app/models/shop_app/login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {

  late final ShopLoginModel loginModel;
  ShopLoginSuccessState(this.loginModel);

}

class ShopLoginErrorState extends ShopLoginStates {

  late final String error;

  ShopLoginErrorState({


    required this.error,

});

}


class ShopLogChangeIconState extends ShopLoginStates {}