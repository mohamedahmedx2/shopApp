import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButton({
  // common use
  //   عملناها هنا common use عشان هما شائعين للاستخدام
  //    لو حبيت اغير فيهم عادي بيتغيرو وبيتعمل عليهم override
  // لو مغيرتش فيهم بيتبعتو زي ما هما
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUppercase = true,
  double radius = 7,


// دول مطلوبين انهم بيتبعتو
  required Function() function,
  required String text,
}) =>
    Container(
      height: 40,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );





Widget defaultFormField({
  required TextEditingController control1,
  required TextInputType type,
  required String? Function(String?) validate,
  required String label1,
  TextStyle? labelStyle2,
  required IconData prefix1,
  IconData? suffix2,
   Function(String)? functionOnSub2,
   Function(String)? functionOnCh3,
  bool scureText = false,
  Function? suffixPressed,
}) =>
    TextFormField(
      obscureText: scureText,
      controller: control1,
      keyboardType: type,
      onFieldSubmitted: (s) {
        functionOnSub2!(s);
      },
      onChanged: (f) {
        functionOnCh3!(f);
      },
      validator: validate,
      decoration: InputDecoration(
        labelText: label1,
        labelStyle: labelStyle2,
        prefixIcon: Icon(
          prefix1,
        ),
        suffixIcon: suffix2 != null ? IconButton(
          onPressed: () {
            suffixPressed!();
          },
          icon: Icon(
            suffix2,
          ),
        ) : null,
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(25)
        ),
      ),
    );




void showToast ({
  required String text,
  required ToastStates state
}) =>    Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);


enum ToastStates{SUCCESS, ERROR, WARNING}

Color chooseToastColor(ToastStates state)
{

  Color color;
  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color =  Colors.red;
      break;
    case ToastStates.WARNING:
      color =  Colors.amber;
      break;


  }
  return color;
}